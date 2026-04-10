import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:too_easy_fuel/features/auth/controller/auth_controller.dart';
import 'package:too_easy_fuel/widgets/background_widget.dart';
import 'package:too_easy_fuel/widgets/button_widget.dart';
import 'package:too_easy_fuel/widgets/custom_text_feild.dart';

import '../../../constants/color_constants.dart';
import '../../../widgets/customText_widget.dart';

class EnterEmailScreen extends GetView<AuthController> {
  const EnterEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: radialBackground(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 8.h),
                    child: Image.asset(
                      "assets/png/too_easy_fuel_logo.png",
                      height: 16.h,
                      width: 35.w,
                    ),
                  ),
                ),
                SizedBox(height: 2.h),
                customText(
                  text: "Forgot\nPassword",
                  color: blueAppBarColor,
                  fontFamily: "bl_melody",
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700,
                  height: 0.13.h,
                ),
                SizedBox(height: 1.h),

                customText(
                  text:
                  "Enter an email address to receive a verification code.",
                  fontSize: 15.sp,
                ),
                SizedBox(height: 3.h),
                emailTextFeild("Email", "Enter your e-mail address","assets/png/auth_image/field-icons-email.png",controller),
                SizedBox(height: 4.h),
                buttonWidget("Continue", whiteColor,isGradient: true,height: 6.h,fontsize: 15.5.sp,onTap: (){
                  // Get.toNamed("otp");
                  Get.toNamed("otp");

                }),
                SizedBox(height: 4.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    customText(
                      text:
                      "Back To",
                      fontSize: 15.sp,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(width: 1.w),
                    InkWell(
                      onTap: (){
                        Get.offAllNamed("login");
                      },
                      child: customText(
                        text:
                        "Login",
                        fontSize: 15.sp,
                        color: purpleColor,
                        txtDecoration: TextDecoration.underline,
                        decorationColor: redColor,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
