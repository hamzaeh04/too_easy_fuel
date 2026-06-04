import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:http/http.dart' as http;

import 'package:too_easy_fuel/core/services/base_services.dart';
import 'package:too_easy_fuel/utils/shared_prefrences_methods.dart';

import '../../../constants/local_db_key.dart';
import '../../../core/services/apiendpoints.dart';
import '../../../utils/utility.dart';
import '../../../widgets/custom_dialog_widget.dart';

class FleetController extends GetxController{
  // RxBool isChecked = false.obs;
  // RxBool isChecked1 = false.obs;
  // RxBool isChecked2 = false.obs;
  // RxBool isChecked3 = false.obs;
  // RxBool isChecked4 = false.obs;

  RxBool isChecked = false.obs;
  RxBool showExtraFields = false.obs; // 👈 instead of isChecked1,2,3...
  final BaseService baseService = BaseService();
  final prefs = SharedPreferencesMethod.storage;

  final ImagePicker picker = ImagePicker();

  // ✅ correct nullable reactive type
  Rxn<XFile> imageFile = Rxn<XFile>();
  Rxn<XFile> imageFile2 = Rxn<XFile>();

  Future<void> pickImage() async {
    final XFile? picked = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (picked != null) {
      if (imageFile.value == null) {
        imageFile.value = picked;
      } else {
        imageFile2.value = picked;
      }
    }
  }

  void clearImage() {
    if (imageFile.value != null) {
      imageFile.value = null;
    } else {
      imageFile2.value = null;
    }
  }
  void clearAllImage() {
    imageFile.value = null;
    imageFile2.value = null;
  }

  final TextEditingController equipmentTypeController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController modelController = TextEditingController();
  final TextEditingController yearController = TextEditingController();
  final TextEditingController fuelTypeController = TextEditingController();
  final TextEditingController tankSizeController = TextEditingController();
  final TextEditingController portController = TextEditingController();

  Future<void> addVehicle({
        File? vehicleImage,
        File? licensePlateImage,
    BuildContext? context
      }) async {
    final fields = <String, String>{
      "make": nameController.text.trim(),
      "model": modelController.text.trim(),
      "fuelType": fuelTypeController.text.trim(),
      "tankSize": tankSizeController.text.trim(),
      "port": portController.text.trim(),
    };
    await _sendMultipartRequestEdit(
        ApiEndPoints.addVehicle,
        fields,
        vehicleImage,
        licensePlateImage,
      context
    );
  }

  Future<void> _sendMultipartRequestEdit(
      String endpoint,
      Map<String, String> fields,
      File? vehicleImage,
      File? licensePlateImage,
      BuildContext? context
      ) async {
    try {
      EasyLoading.show(
        status: 'Please wait...',
        maskType: EasyLoadingMaskType.black,
      );
      final url = "${baseService.baseURL}${ApiEndPoints.addVehicle}";
      final uri = Uri.parse(url);
      print("Faaahhh ${url}");

      var request = http.MultipartRequest('POST', uri);
      final token = prefs.getString(LocalDBKeys.TOKEN);
      print("vehicleImage: $vehicleImage");
      print("licenseImage: $licensePlateImage");

      /// Add Headers if required
      request.headers.addAll({
        "Accept": "application/json",
        "Authorization": "Bearer $token",  // if needed
      });

      /// Add text fields
      request.fields.addAll(fields);
      print("📋 Fields: ${request.fields}");

      /// Add vehicle image dynamically
      if (vehicleImage != null) {
        print("📸 Adding vehicleImage: ${vehicleImage.path}");

        // Detect MIME type from file extension
        String ext = path.extension(vehicleImage.path).toLowerCase(); // .jpg, .png, etc.
        String mimeType = 'image/jpeg'; // default
        if (ext == '.png') mimeType = 'image/png';
        else if (ext == '.jpg' || ext == '.jpeg') mimeType = 'image/jpeg';
        else if (ext == '.gif') mimeType = 'image/gif';

        request.files.add(
          await http.MultipartFile.fromPath(
            'vehicleImage', // ✅ MUST match Postman key
            vehicleImage.path,
            contentType: MediaType('image', mimeType.split('/')[1]),
          ),
        );
      }
      /// Add licensePlate image dynamically
      if (licensePlateImage != null) {
        print("📸 Adding vehicleImage: ${licensePlateImage.path}");

        // Detect MIME type from file extension
        String ext = path.extension(licensePlateImage.path).toLowerCase(); // .jpg, .png, etc.
        String mimeType = 'image/jpeg'; // default
        if (ext == '.png') mimeType = 'image/png';
        else if (ext == '.jpg' || ext == '.jpeg') mimeType = 'image/jpeg';
        else if (ext == '.gif') mimeType = 'image/gif';

        request.files.add(
          await http.MultipartFile.fromPath(
            'licensePlateImage', // ✅ MUST match Postman key
            licensePlateImage.path,
            contentType: MediaType('image', mimeType.split('/')[1]),
          ),
        );
      }


      print("⏳ Sending request...");

      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      print("📦 Status: ${response.statusCode}");
      print("📦 Body: ${response.body}");

      final jsonResponse = jsonDecode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        Utils.showToast("${jsonResponse['message']}", false);
        clearVehicleFields();
        customDialog(context!, title: "Vehicle added successfully!", btnText: "Ok", ontap: () => Get.until((route) => route.isFirst), ontapCancel: ()=> Get.until((route) => route.isFirst));
      } else {
        Utils.showToast(
          jsonResponse['message'] ?? "Something went wrong",
          true,
        );
      }
    } catch (e) {
      print("❌ Error: $e");
      Utils.showToast("Check Internet Connection", true);
    } finally {
      EasyLoading.dismiss();
    }
  }

  Future<void> addEquipment({
    File? equipmentImage,
    BuildContext? context
  }) async {
    final fields = <String, String>{
      "equipmentType": equipmentTypeController.text.trim(),
      "model": modelController.text.trim(),
      "fuelType": fuelTypeController.text.trim(),
      "tankSize": tankSizeController.text.trim(),
    };
    await _sendMultipartRequest(
        ApiEndPoints.addEquipment,
        fields,
        equipmentImage,
        context
    );
  }

  Future<void> _sendMultipartRequest(
      String endpoint,
      Map<String, String> fields,
      File? equipmentImage,
      BuildContext? context
      ) async {
    try {
      EasyLoading.show(
        status: 'Please wait...',
        maskType: EasyLoadingMaskType.black,
      );
      final url = "${baseService.baseURL}${ApiEndPoints.addEquipment}";
      final uri = Uri.parse(url);
      print("Faaahhh ${url}");

      var request = http.MultipartRequest('POST', uri);
      final token = prefs.getString(LocalDBKeys.TOKEN);
      print("vehicleImage: $equipmentImage");

      /// Add Headers if required
      request.headers.addAll({
        "Accept": "application/json",
        "Authorization": "Bearer $token",  // if needed
      });

      /// Add text fields
      request.fields.addAll(fields);
      print("📋 Fields: ${request.fields}");

      /// Add licensePlate image dynamically
      if (equipmentImage != null) {
        print("📸 Adding equipmentImage: ${equipmentImage.path}");

        // Detect MIME type from file extension
        String ext = path.extension(equipmentImage.path).toLowerCase(); // .jpg, .png, etc.
        String mimeType = 'image/jpeg'; // default
        if (ext == '.png') mimeType = 'image/png';
        else if (ext == '.jpg' || ext == '.jpeg') mimeType = 'image/jpeg';
        else if (ext == '.gif') mimeType = 'image/gif';

        request.files.add(
          await http.MultipartFile.fromPath(
            'equipmentImage', // ✅ MUST match Postman key
            equipmentImage.path,
            contentType: MediaType('image', mimeType.split('/')[1]),
          ),
        );
      }


      print("⏳ Sending request...");

      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      print("📦 Status: ${response.statusCode}");
      print("📦 Body: ${response.body}");

      final jsonResponse = jsonDecode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        Utils.showToast("${jsonResponse['message']}", false);
        clearVehicleFields();
        customDialog(context!, title: "Equipment added successfully!", btnText: "Ok", ontap: () => Get.until((route) => route.isFirst), ontapCancel: ()=> Get.until((route) => route.isFirst));
      } else {
        Utils.showToast(
          jsonResponse['message'] ?? "Something went wrong",
          true,
        );
      }
    } catch (e) {
      print("❌ Error: $e");
      Utils.showToast("Check Internet Connection", true);
    } finally {
      EasyLoading.dismiss();
    }
  }

  void clearVehicleFields(){
    clearAllImage();
    equipmentTypeController.clear();
    nameController.clear();
    modelController.clear();
    yearController.clear();
    fuelTypeController.clear();
    tankSizeController.clear();
    portController.clear();
  }
}