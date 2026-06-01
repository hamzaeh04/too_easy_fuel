import 'package:get/get.dart';

class FleetController extends GetxController{
  // RxBool isChecked = false.obs;
  // RxBool isChecked1 = false.obs;
  // RxBool isChecked2 = false.obs;
  // RxBool isChecked3 = false.obs;
  // RxBool isChecked4 = false.obs;

  RxBool isChecked = false.obs;
  RxBool showExtraFields = false.obs; // 👈 instead of isChecked1,2,3...
}