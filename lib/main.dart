import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:too_easy_fuel/features/splash/views/splash_screen.dart';
import 'package:too_easy_fuel/core/routes/App_Routing.dart';
import 'package:too_easy_fuel/core/bindings/init_binding.dart';

import 'constants/color_constants.dart';
import 'features/orders/controller/order_controller.dart';

void main() {
  Get.put(OrderController()); // 👈 add this
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return Sizer(
        builder: (context, orientation, deviceType) {
          return GetMaterialApp(
            // 1. Keep this for global services
            initialBinding: Binding(),

            // 2. This must match the 'name' in your App Routes
            initialRoute: '/',

            // 3. REMOVE 'home: SplashScreen()'.
            // Having 'home' here can bypass the Binding attached to the '/' route.

            getPages: AppRoutes.routes,
            builder: EasyLoading.init(),
            title: 'Too Easy Fuel',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              // scaffoldBackgroundColor: backgroundColor,
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            ),
          );
        }
    );
  }
}

