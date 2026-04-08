import 'package:get/get.dart';
import 'package:too_easy_fuel/features/onboarding/binding/onboarding_binding.dart';
import 'package:too_easy_fuel/features/onboarding/views/onboarding_one.dart';
import 'package:too_easy_fuel/features/splash/binding/splash_binding.dart';

import '../features/splash/views/splash_screen.dart';
class AppRoutes {
  static List<GetPage<dynamic>> routes = [
    GetPage(name: '/', page: () => SplashScreen(),binding: SplashBinding()),
    GetPage(name: '/onboardingone', page: () => OnboardingOne(),binding: OnboardingBinding()),

  ];
}
