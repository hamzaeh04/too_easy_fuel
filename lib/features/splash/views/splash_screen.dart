import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Import Get
import 'package:sizer/sizer.dart';
import '../controller/splash_controller.dart'; // Import your controller

// Change StatelessWidget to GetView<SplashController>
class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // You don't even need to call Get.find(),
    // GetView gives you a 'controller' variable automatically.

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/jpg/splash_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.only(bottom: 20.h),
                child: Image.asset(
                  "assets/png/too_easy_fuel_logo.png",
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Image.asset(
                "assets/png/petrol_pump_logo.png",
                height: 22.h,
                width: 64.w,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
