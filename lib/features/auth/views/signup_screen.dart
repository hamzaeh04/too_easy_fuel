import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:too_easy_fuel/features/auth/controller/auth_controller.dart';
import 'package:too_easy_fuel/widgets/background_widget.dart';
import 'package:too_easy_fuel/widgets/button_widget.dart';
import 'package:too_easy_fuel/widgets/custom_text_feild.dart';

import '../../../constants/color_constants.dart';
import '../../../widgets/customText_widget.dart';

class SignupScreen extends GetView<AuthController> {
  const SignupScreen({super.key});

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
                  text: "Let’s Get\nStarted",
                  color: blueAppBarColor,
                  fontFamily: "bl_melody",
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700,
                  height: 0.13.h,
                ),
                SizedBox(height: 1.h),

                customText(
                  text:
                  "Elevate your social engagement!",
                  fontSize: 15.sp,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 3.h),
                emailTextFeild("Full Name", "Enter your fullname","assets/png/auth_image/field-icons-user.png",controller),
                SizedBox(height: 1.h),
                emailTextFeild("Email", "Enter your e-mail address","assets/png/auth_image/field-icons-email.png",controller),
                SizedBox(height: 1.h),
                emailTextFeild("Password", "Enter password","assets/png/auth_image/field-icons-password.png",controller,ispassword: true,isPasswordHidden:controller.signupPassword),
                SizedBox(height: 1.h),
                emailTextFeild("Confirm Password", "Enter confirm password","assets/png/auth_image/field-icons-password.png",controller,ispassword: true,isPasswordHidden: controller.signupConfirmPassword),
                SizedBox(height: 2.h),
                Padding(
                  padding: EdgeInsets.only(left: 1.w),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: blueAppBarColor
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(2.2.w),
                          child: Image.asset("assets/png/auth_image/camera.png",height: 3.h,width: 6.w),
                        ),
                      ),
                      SizedBox(width: 2.w),
                      customText(
                        text:
                        "Upload Profile Image",
                        fontSize: 15.sp,
                        color: Colors.black54,
                        textAlign: TextAlign.center,
                      ),customText(
                        text:
                        "*",
                        fontSize: 15.sp,
                        color: redColor,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 4.h),
                Padding(
                  padding: EdgeInsets.only(left: 2.5.w),
                  child: Row(
                    children: [
                      Obx(() => GestureDetector(
                        onTap: () {
                          controller.isChecked.toggle();
                        },
                        child: Container(
                          height: 2.h,
                          width: 4.4.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.sp),
                            border: Border.all(
                              color: blueAppBarColor,
                              width: 0.22.w,
                            ),
                            color: controller.isChecked.value
                                ? blueAppBarColor.withOpacity(0.9)
                                : Colors.transparent,
                          ),

                          /// 🔥 ADD THIS
                          child: controller.isChecked.value
                              ? Center(
                            child: Icon(
                              Icons.check,
                              color: Colors.white,
                              size: 14.sp,
                            ),
                          )
                              : null,
                        ),
                      )),
                      SizedBox(width: 4.w),
                      customText(
                        text:
                        "I accept Terms & Conditions",
                        fontSize: 15.sp,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 4.h),
                buttonWidget("Signup", whiteColor,isGradient: true,height: 6.h,fontsize: 15.5.sp,onTap: (){
                  Get.toNamed("otp");
                }),
                SizedBox(height: 4.h),
                Column(
                  children: [
                    customText(
                      text:
                      "Or Login With",
                      fontSize: 15.sp,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 2.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: (){
                            Get.toNamed("choseplan");
                          },
                            child: Image.asset("assets/png/social_icons/google.png",width: 9.w,)
                        ),
                        SizedBox(width: 4.w),
                        Image.asset("assets/png/social_icons/apple.png",width: 10.w,),
                      ],
                    ),
                    SizedBox(height: 3.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        customText(
                          text:
                          "Already have an account?",
                          fontSize: 15.sp,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(width: 1.w),
                        InkWell(
                          onTap: (){
                            Get.toNamed("login");
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
                SizedBox(height: 8.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
