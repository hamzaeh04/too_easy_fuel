import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:too_easy_fuel/features/auth/controller/auth_controller.dart';
import 'package:too_easy_fuel/widgets/background_widget.dart';
import 'package:too_easy_fuel/widgets/button_widget.dart';
import 'package:too_easy_fuel/widgets/custom_text_feild.dart';

import '../../../constants/color_constants.dart';
import '../../../widgets/customText_widget.dart';

class LoginScreen extends GetView<AuthController> {
  const LoginScreen({super.key});

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
                  text: "Login to your\naccount",
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
                emailTextFeild("Full Name", "Enter your fullname","assets/png/auth_image/field-icons-user.png",controller),
                SizedBox(height: 1.h),
                emailTextFeild("Password", "Enter password","assets/png/auth_image/field-icons-password.png",controller,ispassword: true,isPasswordHidden: controller.loginPassword),
                SizedBox(height: 2.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 1.8.h,
                          width: 4.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.sp),
                              border: Border.all(
                                color: blackColor,
                                width: 0.22.w,
                              )
                          ),
                        ),
                        SizedBox(width: 2.w),
                        customText(
                          text:
                          "Resending in 00:50",
                          fontSize: 15.sp,
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: (){
                        controller.isForgot.value = true;
                        Get.toNamed("email");
                      },
                      child: customText(
                          text:
                          "Forgot Password?",
                          fontSize: 15.sp,
                          color: purpleColor,
                          txtDecoration: TextDecoration.underline,
                          decorationColor: purpleColor

                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4.h),
                buttonWidget("Login", whiteColor,isGradient: true,height: 6.h,fontsize: 15.5.sp,onTap: (){
                  // Get.toNamed("helpsupport");
                  Get.toNamed("navbar");
                }),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
