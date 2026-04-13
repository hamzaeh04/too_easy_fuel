import 'package:get/get.dart';
import 'package:too_easy_fuel/features/onboarding/controller/onboarding_controller.dart';
import 'package:too_easy_fuel/features/setting/controller/setting_controller.dart';

import '../controller/profile_controller.dart';

class ProfileBinding extends Bindings{
  @override
  void dependencies(){
    Get.lazyPut<ProfileController>(
            () => ProfileController());
  }
}
