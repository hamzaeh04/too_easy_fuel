import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:too_easy_fuel/features/auth/controller/auth_controller.dart';
import 'package:too_easy_fuel/widgets/background_widget.dart';
import 'package:too_easy_fuel/widgets/button_widget.dart';
import 'package:too_easy_fuel/widgets/custom_text_feild.dart';

import '../../../constants/color_constants.dart';
import '../../../widgets/customText_widget.dart';
import '../../../widgets/custom_dialog_widget.dart';

class OtpVerification extends GetView<AuthController> {
  const OtpVerification({super.key});

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
                  text: controller.isForgot.value == true ? "Forgot\nPassword":"OTP\nVerification",
                  color: blueAppBarColor,
                  fontFamily: "bl_melody",
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700,
                  height: 0.13.h,
                ),
                SizedBox(height: 1.h),

                customText(
                  text:
                  controller.isForgot.value == true ? "An email has been sent to you with a verification\ncode. Please enter it here.":"We have sent a verification code to\nyour email address.",
                  fontSize: 15.sp,
                ),
                SizedBox(height: 3.h),
                emailTextFeild("OTP", "Enter OTP","assets/png/auth_image/field-icons-Veri.png",controller),
                SizedBox(height: 2.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset("assets/png/auth_image/clock_icon_auth.png",width: 5.w,),
                        SizedBox(width: 2.w),
                        customText(
                          text:
                          "Resending in 00:50",
                          fontSize: 15.sp,
                        ),
                      ],
                    ),
                    customText(
                      text:
                      "Resend Code",
                      fontSize: 15.sp,
                      color: purpleColor,
                      txtDecoration: TextDecoration.underline,
                      decorationColor: purpleColor

                    ),
                  ],
                ),
                SizedBox(height: 4.h),
                buttonWidget("Continue", whiteColor,isGradient: true,height: 6.h,fontsize: 15.5.sp,onTap: (){

                  if(controller.isForgot.value == true){
                    Get.toNamed("forgotsetpassword");
                  }
                 else{
                    // Get.toNamed("login");
                    customDialog(context, containerClr: blueAppBarColor, title: "Your email has been verified successfully. You can now continue to the app.", btnText: "Ok", imgPath: "assets/png/check_icon.png", imageClr: whiteColor, btnTextClr: whiteColor, ontap: (){
                      Get.offAllNamed("choseplan");
                    }, ontapCancel: (){
                      Get.offAllNamed("choseplan");
                    });
                  }
                }),
                controller.isForgot.value == true ?
                Column(
                  children: [
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
                ): SizedBox.shrink(),
                SizedBox(height: 3.h),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
