import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AuthController extends GetxController{

  var isChecked = false.obs;
  var isChecked2 = false.obs;
  var isForgot = false.obs;
  // var isPasswordHidden = true.obs;
  // void togglePasswordVisibility() {
  //   isPasswordHidden.value = !isPasswordHidden.value;
  // }
   var signupPassword = true.obs;
   var signupConfirmPassword = true.obs;
   var loginPassword = true.obs;
  var forgotPassword = true.obs;
  var forgotConfirmPassword = true.obs;
  XFile? imageFile;

  Future<File?> pickImage({
    ImageSource source = ImageSource.gallery,
    int imageQuality = 80,
  }) async {
    final ImagePicker picker = ImagePicker();

    imageFile = await picker.pickImage(
      source: source,
      imageQuality: imageQuality,
    );

    if (imageFile != null) {
      return File(imageFile!.path);
    }
    return null;
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
}

