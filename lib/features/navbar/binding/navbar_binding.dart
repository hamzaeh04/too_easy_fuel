import 'package:get/get.dart';
import 'package:too_easy_fuel/features/navbar/controller/navbar_controller.dart';

class NavbarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NavbarController());
  }
}
