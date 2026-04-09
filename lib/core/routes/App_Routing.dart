import 'package:get/get.dart';
import 'package:too_easy_fuel/features/fleet/binding/fleet_binding.dart';
import 'package:too_easy_fuel/features/notification/binding/notification_binding.dart';
import 'package:too_easy_fuel/features/onboarding/binding/onboarding_binding.dart';
import 'package:too_easy_fuel/features/onboarding/views/onboarding_one.dart';
import 'package:too_easy_fuel/features/orders/binding/order_binding.dart';
import 'package:too_easy_fuel/features/setting/binding/setting_binding.dart';
import 'package:too_easy_fuel/features/setting/views/setting_screen.dart';
import 'package:too_easy_fuel/features/splash/binding/splash_binding.dart';

import '../../features/fleet/views/fleet_screen.dart';
import '../../features/fleet/views/see_equipments.dart';
import '../../features/fleet/views/see_vehicle.dart';
import '../../features/notification/views/notification_screen.dart';
import '../../features/orders/views/order_screen.dart';
import '../../features/orders/views/track_order_screen.dart';
import '../../features/setting/views/aboutus_screen.dart';
import '../../features/setting/views/faqs_screen.dart';
import '../../features/setting/views/support_screen.dart';
import '../../features/setting/views/terms_screen.dart';
import '../../features/splash/views/splash_screen.dart';
class AppRoutes {
  static List<GetPage<dynamic>> routes = [
    GetPage(name: '/', page: () => SplashScreen(),binding: SplashBinding()),
    GetPage(name: '/onboardingone', page: () => OnboardingOne(),binding: OnboardingBinding()),
    GetPage(name: '/helpsupport', page: () => SettingScreen(),binding: SettingBinding()),
    GetPage(name: '/aboutus', page: () => AboutUsScreen(),binding: SettingBinding()),
    GetPage(name: '/support', page: () => SupportScreen(),binding: SettingBinding()),
    GetPage(name: '/terms', page: () => TermsScreen(),binding: SettingBinding()),
    GetPage(name: '/faqs', page: () => FaqsScreen(),binding: SettingBinding()),
    GetPage(name: '/notifications', page: () => NotificationScreen(),binding: NotificationBinding()),
    GetPage(name: '/order', page: () => OrderScreen(),binding: OrderBinding()),
    GetPage(name: '/trackOrder', page: () => TrackOrderScreen(),binding: OrderBinding()),
    GetPage(name: '/trackOrder', page: () => TrackOrderScreen(),binding: OrderBinding()),
    GetPage(name: '/fleet', page: () => FleetScreen(),binding: FleetBinding()),
    GetPage(name: '/seeVehicle', page: () => SeeVehicle(),binding: FleetBinding()),
    GetPage(name: '/seeEquipments', page: () => SeeEquipments(),binding: FleetBinding()),

  ];
}
