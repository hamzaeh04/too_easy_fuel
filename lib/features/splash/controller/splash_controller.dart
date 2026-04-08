import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    _navigateToNext();
  }

  void _navigateToNext() async {
    await Future.delayed(const Duration(seconds: 3));

    // Use offNamed so the user can't go 'back' to the splash screen
    Get.offNamed("/onboardingone");
  }
}
