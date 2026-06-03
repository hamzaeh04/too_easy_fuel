import 'package:get/get.dart';
import 'package:too_easy_fuel/features/navbar/controller/navbar_controller.dart';
import 'package:too_easy_fuel/features/home/controller/home_controller.dart';
import 'package:too_easy_fuel/features/orders/controller/order_controller.dart';
import 'package:too_easy_fuel/features/fleet/controller/fleet_controller.dart';
import 'package:too_easy_fuel/features/profile/controller/profile_controller.dart';

class NavbarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NavbarController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => OrderController());
    Get.lazyPut(() => FleetController());
    Get.lazyPut(() => ProfileController());
  }
}
