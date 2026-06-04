import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

import '../../../constants/color_constants.dart';
import '../../../constants/local_db_key.dart';
import '../../../core/services/apiendpoints.dart';
import '../../../core/services/base_services.dart';
import '../../../utils/shared_prefrences_methods.dart';
import '../../../utils/utility.dart';
import '../../../widgets/custom_dialog_widget.dart';

class ProfileController extends GetxController {
  RxBool isObscure = false.obs;
  RxBool isCurrentPasswordObscure = true.obs;
  RxBool isNewPasswordObscure = true.obs;
  RxBool isConfirmPasswordObscure = true.obs;
  RxBool isOn = true.obs;
  RxBool isOn1 = false.obs;
  RxBool isOn2 = true.obs;

  final prefs = SharedPreferencesMethod.storage;
  final BaseService baseService = BaseService();

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNoController = TextEditingController();
  final TextEditingController addressController = TextEditingController();



  final TextEditingController oldPasswordController =
  TextEditingController();

  final TextEditingController newPasswordController =
  TextEditingController();

  final TextEditingController confirmPasswordController =
  TextEditingController();
  final ImagePicker _picker = ImagePicker();
  Rxn<File> profileImage = Rxn<File>();
  RxString networkProfileImage = "".obs;

  @override
  void onInit() {
    super.onInit();
    loadUserData();
  }

  void loadUserData() {
    final String? userJson = prefs.getString(LocalDBKeys.USERDETAIL);
    if (userJson != null && userJson.isNotEmpty) {
      try {
        final Map<String, dynamic> user = jsonDecode(userJson);
        fullNameController.text = user['fullName'] ?? '';
        emailController.text = user['email'] ?? '';
        phoneNoController.text = user['phoneNo'] ?? '';
        addressController.text = user['address'] ?? '';
        networkProfileImage.value = user['profileImage'] ?? '';
      } catch (e) {
        print("Error decoding user details: $e");
      }
    } else {
      fullNameController.text = prefs.getString(LocalDBKeys.USERFULLNAME) ?? '';
      emailController.text = prefs.getString(LocalDBKeys.USEREMAIL) ?? '';
      phoneNoController.text = prefs.getString(LocalDBKeys.PHONENUMBER) ?? '';
      networkProfileImage.value = prefs.getString(LocalDBKeys.USERPROFILEPIC) ?? '';
    }
  }

  Future<void> pickProfileImage() async {
    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: ImageSource.gallery,
      );
      if (pickedFile != null) {
        profileImage.value = File(pickedFile.path);
      }
    } catch (e) {
      print("Error picking image: $e");
    }
  }

  Future<void> updateProfile(BuildContext context) async {
    try {
      EasyLoading.show(
        status: 'Updating profile...',
        maskType: EasyLoadingMaskType.black,
      );

      final uri = Uri.parse(
        "${BaseService().baseURL}${ApiEndPoints.updateProfile}",
      );

      final request = http.MultipartRequest('PATCH', uri);

      // Add fields
      request.fields['fullName'] = fullNameController.text.trim();
      request.fields['email'] = emailController.text.trim();
      request.fields['phoneNo'] = phoneNoController.text.trim();
      request.fields['address'] = addressController.text.trim();

      // Profile Image
      if (profileImage.value != null && await profileImage.value!.exists()) {
        final fileName = profileImage.value!.path.split('/').last;
        final extension = fileName.split('.').last.toLowerCase();
        final subType = (extension == 'png' || extension == 'jpg' || extension == 'jpeg' || extension == 'gif')
            ? extension
            : 'png';

        request.files.add(
          await http.MultipartFile.fromPath(
            'profileImage',
            profileImage.value!.path,
            filename: fileName,
            contentType: MediaType('image', subType == 'jpg' ? 'jpeg' : subType),
          ),
        );
      }

      // Headers (Authorization bearer token)
      final bearerToken = await prefs.getString(LocalDBKeys.TOKEN);
      if (bearerToken != null && bearerToken.isNotEmpty) {
        request.headers['Authorization'] = 'Bearer $bearerToken';
      }

      print("🚀 Update Profile URL: $uri");
      print("📤 Update Profile Fields: ${request.fields}");
      print("📷 File: ${profileImage.value?.path ?? 'No file'}");

      final streamedResponse = await request.send().timeout(const Duration(seconds: 60));
      final responseString = await streamedResponse.stream.bytesToString();
      print("📥 Update Profile Raw Response: $responseString");

      final responseMap = jsonDecode(responseString) as Map<String, dynamic>;
      final bool success = responseMap['success'] ?? false;
      final int statusCode = streamedResponse.statusCode;

      if (success && (statusCode >= 200 && statusCode < 300)) {
        // Save the updated details locally
        final updatedUser = responseMap['data'] ?? responseMap['user'] ?? {};
        
        final String? existingUserJson = prefs.getString(LocalDBKeys.USERDETAIL);
        Map<String, dynamic> existingUser = {};
        if (existingUserJson != null && existingUserJson.isNotEmpty) {
          try {
            existingUser = jsonDecode(existingUserJson);
          } catch (_) {}
        }
        
        // Merge updated values
        updatedUser.forEach((key, value) {
          existingUser[key] = value;
        });

        await prefs.setString(LocalDBKeys.USERDETAIL, jsonEncode(existingUser));

        // Update individual keys
        if (existingUser['fullName'] != null) {
          await prefs.setString(LocalDBKeys.USERFULLNAME, existingUser['fullName']);
        }
        if (existingUser['email'] != null) {
          await prefs.setString(LocalDBKeys.USEREMAIL, existingUser['email']);
        }
        if (existingUser['profileImage'] != null) {
          await prefs.setString(LocalDBKeys.USERPROFILEPIC, existingUser['profileImage']);
        }
        if (existingUser['phoneNo'] != null) {
          await prefs.setString(LocalDBKeys.PHONENUMBER, existingUser['phoneNo']);
        }

        Utils.showToast(responseMap['message'] ?? "Profile updated successfully", false);
        
        customDialog(context, containerClr: blueColor, title: "Profile has been updated successfully", ontap: () {
          Get.back(); // Dismiss dialog
          Get.back(); // Go back to profile screen
        });
      } else {
        final errorMsg = responseMap['message'] is List
            ? (responseMap['message'] as List).join(', ')
            : responseMap['message']?.toString() ?? "Failed to update profile";
        Utils.showToast(errorMsg, true);
      }
    } on TimeoutException {
      Utils.showToast("Request timed out", true);
    } on SocketException {
      Utils.showToast("No Internet connection", true);
    } catch (e) {
      print("❌ Update Profile Error: $e");
      Utils.showToast("Unexpected error: $e", true);
    } finally {
      EasyLoading.dismiss();
    }
  }

  Future<void> updatePassword(BuildContext context) async {
    final body = {
      'oldPassword': oldPasswordController.text.trim(),
      'newPassword': newPasswordController.text.trim(),
      'confirmPassword': confirmPasswordController.text.trim(),
    };

    try {
      final response = await baseService.basePostAPI(
        ApiEndPoints.changePassword,
        body,
        loading: true,
      );

      if (response == null || response == false) {
        Utils.showToast('Check Internet Connection', true);
        return;
      }

      final bool success = response['success'] ?? false;
      final int statusCode = response['statusCode'] ?? 0;
      final String message = response['message'] ?? '';

      if (success || (statusCode >= 200 && statusCode < 300)) {
        Utils.showToast(message.isNotEmpty ? message : 'Password updated successfully', false);
        
        // Clear password fields
        oldPasswordController.clear();
        newPasswordController.clear();
        confirmPasswordController.clear();

        customDialog(
          context,
          containerClr: blueColor,
          title: "Password has been updated successfully",
          ontap: () {
            Get.back(); // Dismiss dialog
            Get.back(); // Go back to settings/profile
          },
        );
      } else {
        Utils.showToast(message.isNotEmpty ? message : 'Failed to update password', true);
      }
    } catch (e) {
      print("Error changing password: $e");
      Utils.showToast('Something went wrong. Please try again.', true);
    }
  }

  void toggleObscure() {
    isObscure.value = !isObscure.value;
  }
}
