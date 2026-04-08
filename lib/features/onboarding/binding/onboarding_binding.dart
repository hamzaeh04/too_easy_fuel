import 'package:get/get.dart';
import 'package:too_easy_fuel/features/onboarding/controller/onboarding_controller.dart';

class OnboardingBinding extends Bindings{
  @override
  void dependencies(){
    Get.lazyPut<OnboardingController>(
            () => OnboardingController());
  }
}
