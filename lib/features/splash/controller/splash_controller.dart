import 'package:get/get.dart';
import 'package:too_easy_fuel/constants/local_db_key.dart';
import 'package:too_easy_fuel/utils/shared_prefrences_methods.dart';

class SplashController extends GetxController {
  final prefs = SharedPreferencesMethod.storage;
  @override
  void onReady() {
    super.onReady();
    _navigateToNext();
  }

  void _navigateToNext() async {
    await Future.delayed(const Duration(seconds: 3));

    // Use offNamed so the user can't go 'back' to the splash screen
    final token = prefs.getString(LocalDBKeys.TOKEN);
    final first = prefs.getBool(LocalDBKeys.FIRSTTIMEOPENAPP);
    print(token);
    if(token == null || token.isEmpty){
      if(first != true){
        Get.offNamed("/onboardingone");
      } else{
        Get.offNamed("/login");
      }
    } else{
      Get.offAllNamed("/navbar");
    }
  }
}
