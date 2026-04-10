import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:too_easy_fuel/features/auth/controller/auth_controller.dart';
import 'package:too_easy_fuel/widgets/background_widget.dart';
import 'package:too_easy_fuel/widgets/custom_text_feild.dart';

import '../../../constants/color_constants.dart';
import '../../../widgets/button_widget.dart';
import '../../../widgets/customText_widget.dart';
import '../../../widgets/custom_dialog_widget.dart';

class ForgotSetPassword extends GetView<AuthController> {
  const ForgotSetPassword({super.key});

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
                  "Set a new password for your account",
                  fontSize: 15.sp,
                ),
                SizedBox(height: 3.h),
                emailTextFeild("Password", "Enter password","assets/png/auth_image/field-icons-password.png",controller,ispassword: true,isPasswordHidden: controller.forgotPassword),
                SizedBox(height: 1.h),
                emailTextFeild("Password", "Enter password","assets/png/auth_image/field-icons-password.png",controller,ispassword: true,isPasswordHidden: controller.forgotConfirmPassword),
                SizedBox(height: 4.h),
                buttonWidget("Continue", whiteColor,isGradient: true,height: 6.h,fontsize: 15.5.sp,onTap: (){
                  controller.isForgot.value= false;
                  customDialog(context, containerClr: blueAppBarColor, title: "Your password has been updated successfully.", btnText: "Login to Continue", imgPath: "assets/png/check_icon.png", imageClr: whiteColor, btnTextClr: whiteColor, ontap: (){
                    Get.offAllNamed("login");
                  }, ontapCancel: (){
                    Get.offAllNamed("login");
                  });
                }),
                SizedBox(height: 3.h),
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
