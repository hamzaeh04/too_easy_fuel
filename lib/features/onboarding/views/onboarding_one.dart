import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:too_easy_fuel/constants/color_constants.dart';
import 'package:too_easy_fuel/widgets/customText_widget.dart';
import 'package:too_easy_fuel/features/onboarding/widgets/onboard_widget.dart';
import 'package:too_easy_fuel/features/onboarding/widgets/slide_widget.dart';
import 'package:too_easy_fuel/widgets/button_widget.dart';

import '../controller/onboarding_controller.dart';

class OnboardingOne extends GetView<OnboardingController> {
  const OnboardingOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/jpg/getstarted_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            /// 🔹 TOP CONTENT (NO SCROLL)
            Obx(() {
              switch (controller.selectedIndex.value) {
                case 0:
                  return onBoardingOne();

                case 1:
                  return onBoardingTwo();

                default:
                  return onBoardingThree();
              }
            }),

            /// 🔥 FIXED BOTTOM SECTION
            Positioned(
              bottom: 6.h,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  slideWidget(controller.selectedIndex),

                  SizedBox(height: 3.h),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: buttonWidget(
                      "Next",
                      blackColor,
                      colors: whiteColor,
                      fontsize: 15.5.sp,
                      fontweight: FontWeight.w600,
                      onTap: (){
                        if(controller.selectedIndex.value == 2){
                          Get.toNamed("signup");
                        }
                        else
                          {
                            controller.updateIndex();
                          }

                      }
                    ),
                  ),

                  SizedBox(height: 2.h),

                  InkWell(
                    onTap: (){
                      Get.offNamed("helpsupport");
                      print("skip tapped");
                    },
                    child: InkWell(
                      onTap: (){
                        Get.toNamed("signup");
                      },
                      child: customText(
                        text: "Skip",
                        color: whiteColor,
                        fontSize: 15.sp,
                        textAlign: TextAlign.center,
                        txtDecoration: TextDecoration.underline,
                        decorationColor: whiteColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
