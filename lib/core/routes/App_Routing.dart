import 'package:get/get.dart';
import 'package:too_easy_fuel/features/auth/binding/auth_binding.dart';
import 'package:too_easy_fuel/features/auth/controller/auth_controller.dart';
import 'package:too_easy_fuel/features/auth/views/forgot_email_screen.dart';
import 'package:too_easy_fuel/features/auth/views/forgot_set_password.dart';
import 'package:too_easy_fuel/features/auth/views/login_screen.dart';
import 'package:too_easy_fuel/features/auth/views/otp_verification.dart';
import 'package:too_easy_fuel/features/auth/views/signup_screen.dart';
import 'package:too_easy_fuel/features/notification/binding/notification_binding.dart';
import 'package:too_easy_fuel/features/onboarding/binding/onboarding_binding.dart';
import 'package:too_easy_fuel/features/onboarding/views/onboarding_one.dart';
import 'package:too_easy_fuel/features/setting/binding/setting_binding.dart';
import 'package:too_easy_fuel/features/setting/views/setting_screen.dart';
import 'package:too_easy_fuel/features/splash/binding/splash_binding.dart';
import 'package:too_easy_fuel/features/subscription/views/add_payment_screen.dart';
import 'package:too_easy_fuel/features/subscription/views/choose_your_plan.dart';
import 'package:too_easy_fuel/features/subscription/views/payment_method_screen.dart';
import 'package:too_easy_fuel/features/subscription/views/subscription_payment.dart';

import '../../features/fleet/binding/fleet_binding.dart';
import '../../features/fleet/views/fleet_screen.dart';
import '../../features/fleet/views/see_equipments.dart';
import '../../features/fleet/views/see_vehicle.dart';
import '../../features/notification/views/notification_screen.dart';
import '../../features/orders/binding/order_binding.dart';
import '../../features/orders/views/order_screen.dart';
import '../../features/orders/views/track_order_screen.dart';
import '../../features/profile/binding/profile_binding.dart';
import '../../features/profile/views/change_password.dart';
import '../../features/profile/views/edit_profile.dart';
import '../../features/profile/views/notification_setting.dart';
import '../../features/profile/views/profile_screen.dart';
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
    GetPage(name: '/signup', page: () => SignupScreen(),binding: AuthBinding()),
    GetPage(name: '/otp', page: () => OtpVerification(),binding: AuthBinding()),
    GetPage(name: '/login', page: () => LoginScreen(),binding: AuthBinding()),
    GetPage(name: '/email', page: () => EnterEmailScreen(),binding: AuthBinding()),
    GetPage(name: '/forgotsetpassword', page: () => ForgotSetPassword(),binding: AuthBinding()),
    GetPage(name: '/order', page: () => OrderScreen(),binding: OrderBinding()),
    GetPage(name: '/trackOrder', page: () => TrackOrderScreen(),binding: OrderBinding()),
    GetPage(name: '/trackOrder', page: () => TrackOrderScreen(),binding: OrderBinding()),
    GetPage(name: '/fleet', page: () => FleetScreen(),binding: FleetBinding()),
    GetPage(name: '/seeVehicle', page: () => SeeVehicle(),binding: FleetBinding()),
    GetPage(name: '/seeEquipments', page: () => SeeEquipments(),binding: FleetBinding()),
    GetPage(name: '/choseplan', page: () => ChooseYourPlan()),
    GetPage(name: '/SubscriptionPayment', page: () => SubscriptionPayment()),
    GetPage(name: '/AddPayment', page: () => AddPaymentScreen()),
    GetPage(name: '/PaymentMethod', page: () => PaymentMethodScreen()),
    GetPage(name: '/profile', page: () => ProfileScreen(),binding: ProfileBinding()),
    GetPage(name: '/editprofile', page: () => EditProfileScreen(),binding: ProfileBinding()),
    GetPage(name: '/changePassword', page: () => ChangePasswordScreen(),binding: ProfileBinding()),
    GetPage(name: '/notificationSetting', page: () => NotificationSettingScreen(),binding: ProfileBinding()),
    GetPage(name: '/notificationSetting', page: () => NotificationSettingScreen(),binding: ProfileBinding()),

  ];
}
