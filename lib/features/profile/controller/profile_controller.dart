import 'package:get/get.dart';

class ProfileController extends GetxController{
  RxBool isObscure = false.obs;
  RxBool isOn = true.obs;
  RxBool isOn1 = false.obs;
  RxBool isOn2 = true.obs;
  void toggleObscure(){
    isObscure.value = !isObscure.value;
  }
}