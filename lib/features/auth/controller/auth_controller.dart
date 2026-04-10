import 'package:get/get.dart';

class AuthController extends GetxController{

  var isChecked = false.obs;
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
}
