import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:too_easy_fuel/utils/shared_prefrences_methods.dart';

import '../../../constants/color_constants.dart';
import '../../../constants/local_db_key.dart';
import '../../../core/services/apiendpoints.dart';
import '../../../core/services/base_services.dart';
import '../../../utils/utility.dart';
import '../../../widgets/custom_dialog_widget.dart';

class AuthController extends GetxController{

  var isChecked = false.obs;
  var isChecked2 = false.obs;
  var isForgot = false.obs;
  String email = "";
  RxInt remainingSeconds = 120.obs;
  Timer? _timer;
  final prefs = SharedPreferencesMethod.storage;
  // var isPasswordHidden = true.obs;
  // void togglePasswordVisibility() {
  //   isPasswordHidden.value = !isPasswordHidden.value;
  // }
  BaseService baseService = BaseService();
   var signupPassword = true.obs;
   var signupConfirmPassword = true.obs;
   var loginPassword = true.obs;
  var forgotPassword = true.obs;
  var forgotConfirmPassword = true.obs;
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPaswordController = TextEditingController();
  final TextEditingController otpController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  Rxn<File> profilePictureSignup = Rxn<File>();


  void startTimer() {
    _timer?.cancel();

    remainingSeconds.value = 120;

    _timer = Timer.periodic(
      const Duration(seconds: 1),
          (timer) {
        if (remainingSeconds.value > 0) {
          remainingSeconds.value--;
        } else {
          timer.cancel();
        }
      },
    );
  }

  Future<void> pickImage(Rxn<File> profilePicture) async {
    try {
      // 🔥 iOS: let image_picker handle permission
      if (Platform.isIOS) {
        final XFile? pickedFile = await _picker.pickImage(
          source: ImageSource.gallery,
        );

        if (pickedFile != null) {
          profilePicture.value = File(pickedFile.path);
        }
        return;
      }

      // 🤖 Android: manual permission handling
      PermissionStatus status = await _requestStoragePermission();

      if (status.isDenied) {
        Utils.showToast("Permission denied", true);
        return;
      }

      if (status.isPermanentlyDenied) {
        Utils.showToast(
          "Permission permanently denied. Please enable it from settings.",
          true,
        );
        await openAppSettings();
        return;
      }

      final XFile? pickedFile = await _picker.pickImage(
        source: ImageSource.gallery,
      );

      if (pickedFile != null) {
        profilePicture.value = File(pickedFile.path);
      }
    } catch (e) {
      Utils.showToast("Error picking image: $e", true);
    }
  }

  Future<PermissionStatus> _requestStoragePermission() async {
    if (Platform.isAndroid) {
      if (await _isAndroid13OrAbove()) {
        return await Permission.photos.request();
      } else {
        return await Permission.storage.request();
      }
    }
    return PermissionStatus.granted; // iOS handled by image_picker
  }


  Future<bool> _isAndroid13OrAbove() async {
    if (Platform.isAndroid) {
      var androidInfo = await DeviceInfoPlugin().androidInfo;
      return androidInfo.version.sdkInt >= 33;
    }
    return false;
  }

  final TextEditingController expiryMonthController = TextEditingController();
  final TextEditingController expiryYearController = TextEditingController();

  final List<String> months = [
    "January", "February", "March", "April",
    "May", "June", "July", "August",
    "September", "October", "November", "December"
  ];

  List<String> generateExpiryYears({int yearsAhead = 10}) {
    final int currentYear = DateTime.now().year;

    return List<String>.generate(
      yearsAhead + 1,
          (index) => (currentYear + index).toString(),
    );
  }
  late final List<String> expiryYears = generateExpiryYears();


  Future<void> signUp(
      BuildContext context, {
        File? profilePicture,
      }) async {
    try {
      EasyLoading.show(
        status: 'Please wait...',
        maskType: EasyLoadingMaskType.black,
      );

      final uri = Uri.parse(
        "${BaseService().baseURL}${ApiEndPoints.signupUser}",
      );

      final request = http.MultipartRequest('POST', uri);

      // Fields
      request.fields['fullName'] = fullNameController.text.trim();
      request.fields['email'] = emailController.text.trim();
      request.fields['password'] = passwordController.text.trim();
      request.fields['confirmPassword'] =
          confirmPaswordController.text.trim();
      request.fields['isTermsAccepted'] =
          isChecked.value.toString();

      // Profile Image
      if (profilePicture != null &&
          await profilePicture.exists()) {
        final fileName =
            profilePicture.path.split('/').last;

        request.files.add(
          await http.MultipartFile.fromPath(
            'profileImage',
            profilePicture.path,
            filename: fileName,
            contentType: MediaType('image', 'png'),
          ),
        );
      }

      // Debug Logs
      print("🚀 Signup URL: $uri");
      print("📤 Signup Fields: ${request.fields}");
      print(
        "📷 File: ${profilePicture?.path ?? 'No file attached'}",
      );

      // Optional Auth Header
      final bearerToken =
      await prefs.getString(LocalDBKeys.TOKEN);

      if (bearerToken != null &&
          bearerToken.isNotEmpty) {
        request.headers['Authorization'] =
        'Bearer $bearerToken';
      }

      // Send Request
      final streamedResponse = await request
          .send()
          .timeout(const Duration(seconds: 60));

      final responseString =
      await streamedResponse.stream.bytesToString();

      print("📥 Raw Response: $responseString");

      final responseMap =
      jsonDecode(responseString) as Map<String, dynamic>;

      final bool success =
          responseMap['success'] ?? false;

      final int statusCode =
          streamedResponse.statusCode;

      print("✅ Parsed Response: $responseMap");
      print("📌 Status Code: $statusCode");

      // Success
      // Success
      if (success && statusCode == 201) {
        final successMsg = responseMap['message'] is List
            ? (responseMap['message'] as List).join(', ')
            : (responseMap['message']?.toString() ?? "Signup successful");

        Utils.showToast(
          successMsg,
          false,
        );

        final prefsInstance =
        await SharedPreferences.getInstance();

        await prefsInstance.setString(
          LocalDBKeys.USERFULLNAME,
          fullNameController.text.trim(),
        );

        await prefsInstance.setString(
          LocalDBKeys.USEREMAIL,
          emailController.text.trim(),
        );
        email = emailController.text;
        startTimer();
        Get.toNamed("otp");
        return;
      }

      // Error Handling
      final errorMsg = responseMap['message'] is List
          ? (responseMap['message'] as List).join(', ')
          : (responseMap['message']?.toString());

      if (statusCode == 400) {
        Utils.showToast(
          errorMsg ?? "Bad request",
          true,
        );
      } else if (statusCode == 401) {
        Utils.showToast(
          errorMsg ?? "Unauthorized",
          true,
        );
      } else if (statusCode == 404) {
        Utils.showToast(
          errorMsg ?? "Not found",
          true,
        );
      } else if (statusCode >= 500) {
        Utils.showToast(
          errorMsg ?? "Server error",
          true,
        );
      } else {
        Utils.showToast(
          errorMsg ?? "Signup failed",
          true,
        );
      }
    } on TimeoutException {
      Utils.showToast(
        "Request timed out",
        true,
      );
    } on SocketException {
      Utils.showToast(
        "No Internet connection",
        true,
      );
    } catch (e, stackTrace) {
      print("❌ Signup Error: $e");
      print(stackTrace);

      Utils.showToast(
        "Unexpected error: $e",
        true,
      );
    } finally {
      EasyLoading.dismiss();
    }
  }
  Future<void> login() async {
    final fcmToken = prefs.getString("FCMTOKEN");

    final body = {
      'email': emailController.text.trim(),
      'password': passwordController.text.trim(),
      'rememberMe': isChecked2.value.toString(),
    };

    try {
      final response = await baseService.basePostAPI(
        ApiEndPoints.login,
        body,
        loading: true,
      );

      if (response == null || response == false) {
        Utils.showToast('Check Internet Connection', true);
        return;
      }

      if (response is! Map<String, dynamic>) {
        Utils.showToast('Unexpected response format', true);
        return;
      }

      final data = response['data'];

      if (data == null) {
        Utils.showToast(response['message'] ?? 'Login failed', true);
        return;
      }

      // 🔥 CASE 1: User NOT verified
      if (data['isVerified'] == false) {
        Utils.showToast(response['message'], true);

        Get.toNamed("verification", arguments: {
          "email": data['email'],
        });

        return; // ⛔ STOP HERE
      }

      // 🔥 CASE 2: Verified user (normal login)
      final user = data['user'];
      final token = data['accessToken'];

      if (user == null || token == null) {
        Utils.showToast('Invalid server response', true);
        return;
      }

      // ✅ Safe extraction
      final prefs = SharedPreferencesMethod.storage;

      await prefs.setString(LocalDBKeys.USERDETAIL, jsonEncode(user));
      await prefs.setString(LocalDBKeys.USERID, user['id'] ?? "");
      await prefs.setString(LocalDBKeys.USERFULLNAME, user['fullname'] ?? "");
      await prefs.setString(LocalDBKeys.USEREMAIL, user['email'] ?? "");
      await prefs.setString(LocalDBKeys.PHONENUMBER, user['phone'] ?? "");
      await prefs.setString(LocalDBKeys.USERPROFILEPIC, user['profilePicture'] ?? "");
      await prefs.setString(LocalDBKeys.TOKEN, token);
      print("✅ User stored");
      print("✅ Token: $token");
      print("✅ Token: ${user['id']}");

      Utils.showToast(response['message'] ?? 'Login successful', false);

      Get.offAllNamed("navbar");

    } catch (e, stackTrace) {
      print("Login error: $e");
      print(stackTrace);
      Utils.showToast('Something went wrong. Please try again.', true);
    }
  }

  Future<void> verifyOtp(BuildContext context,{String? type}) async {
    final body = {
      'email': email,
      'otp': otpController.text,
      'type': type,
    };

    print("Forgot password flag = ${forgotPassword.value}");

    try {
      var response = await baseService.basePostAPI(
        ApiEndPoints.verifyOtp,
        body,
        loading: true,
      );

      if (response == false || response == null) {
        Utils.showToast('Check Internet Connection', true);
        return;
      }

      final int statusCode = response['statusCode'] ?? 0;

      if (statusCode >= 200 && statusCode < 300) {
        Utils.showToast(response['message'] ?? 'OTP Verified Successfully', false);
          // clearSignupFields();
          if(isForgot.value == true){
            Get.toNamed("forgotsetpassword");
          }
          else{
            // Get.toNamed("login");
            customDialog(context, containerClr: blueAppBarColor, title: "Your email has been verified successfully. You can now continue to the app.", btnText: "Ok", imgPath: "assets/png/check_icon.png", imageClr: whiteColor, btnTextClr: whiteColor, ontap: (){
              clearAllSignUpFeilds();
              Get.offAllNamed("choseplan");
            }, ontapCancel: (){
              clearAllSignUpFeilds();
              Get.offAllNamed("choseplan");
            });
          }
      }

    } catch (e) {
      Utils.showToast('Something went wrong: $e', true);
    }
  }
  Future<void> resendOtp(BuildContext context,{String? type}) async {
    final body = {
      'email': email,
      'type': type,
    };

    print("Forgot password flag = ${forgotPassword.value}");

    try {
      var response = await baseService.basePostAPI(
        ApiEndPoints.resendOtp,
        body,
        loading: true,
      );

      if (response == false || response == null) {
        Utils.showToast('Check Internet Connection', true);
        return;
      }

      final int statusCode = response['statusCode'] ?? 0;

      if (statusCode >= 200 && statusCode < 300) {
        Utils.showToast(response['message'] ?? 'OTP Verified Successfully', false);
      }

    } catch (e) {
      Utils.showToast('Something went wrong: $e', true);
    }
  }

  clearAllSignUpFeilds(){
    fullNameController.clear();
    emailController.clear();
    passwordController.clear();
    confirmPaswordController.clear();
    otpController.clear();
  }

}

