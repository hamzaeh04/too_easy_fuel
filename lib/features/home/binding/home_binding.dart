import 'package:get/get.dart';
import 'package:too_easy_fuel/features/home/controller/home_controller.dart';
import 'package:too_easy_fuel/features/notification/controller/notification_controller.dart';

class HomeBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<HomeController>(
            () => HomeController()
    );
  }

}