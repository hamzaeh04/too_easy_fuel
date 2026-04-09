import 'package:get/get.dart';
import 'package:too_easy_fuel/features/onboarding/controller/onboarding_controller.dart';
import 'package:too_easy_fuel/features/setting/controller/setting_controller.dart';

class SettingBinding extends Bindings{
  @override
  void dependencies(){
    Get.lazyPut<SettingController>(
            () => SettingController());
  }
}
