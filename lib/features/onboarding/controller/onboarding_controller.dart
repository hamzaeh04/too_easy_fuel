import 'package:get/get.dart';

class OnboardingController extends GetxController {
  var selectedIndex = 0.obs;

  void updateIndex() {
    if (selectedIndex.value < 2) {
      selectedIndex.value++;
    }
  }
}
