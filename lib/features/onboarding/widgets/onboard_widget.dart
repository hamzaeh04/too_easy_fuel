import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/color_constants.dart';
import '../../../constants/constants_widgets.dart';

Widget onBoardingOne(){
  return SizedBox(
    width: double.infinity,
    child: Column(
    children: [
      Padding(
        padding: EdgeInsets.only(top: 8.h),
        child: Image.asset(
          "assets/png/too_easy_fuel_logo.png",
          height: 16.h,
          width: 35.w,
        ),
      ),

      Image.asset(
        "assets/png/onboarding/one.png",
        width: 80.w,
      ),

      customText(
        text: "Fuel Delivery On Demand",
        color: whiteColor,
        fontFamily: "bl_melody",
        fontSize: 24.sp,
        textAlign: TextAlign.center,
        fontWeight: FontWeight.w700,
        height: 0.13.h,
      ),

      SizedBox(height: 2.h),

      customText(
        text:
        "A mobile platform that delivers fuel directly to\ncustomers' vehicles anytime, anywhere.",
        color: whiteColor,
        fontSize: 15.sp,
        textAlign: TextAlign.center,
      ),

    ],
    ));
}

Widget onBoardingTwo(){
  return SizedBox(
    width: double.infinity,
    child: Column(
    children: [
      Padding(
        padding: EdgeInsets.only(top: 8.h),
        child: Image.asset(
          "assets/png/too_easy_fuel_logo.png",
          height: 16.h,
          width: 35.w,
        ),
      ),

      Image.asset(
        "assets/png/onboarding/two.png",
        width: 80.w,
      ),

      customText(
        text: "Too Easy Fuel",
        color: whiteColor,
        fontFamily: "bl_melody",
        fontSize: 24.sp,
        textAlign: TextAlign.center,
        fontWeight: FontWeight.w700,
        height: 0.13.h,
      ),

      SizedBox(height: 2.h),

      customText(
        text:
        "A subscription-based on-demand fuel delivery platform\nfor customers, drivers, and administrators.",
        color: whiteColor,
        fontSize: 15.sp,
        textAlign: TextAlign.center,
      ),

    ],
    ));
}
Widget onBoardingThree(){
  return SizedBox(
    width: double.infinity,
    child: Column(
    children: [
      Padding(
        padding: EdgeInsets.only(top: 8.h),
        child: Image.asset(
          "assets/png/too_easy_fuel_logo.png",
          height: 16.h,
          width: 35.w,
        ),
      ),

      Image.asset(
        "assets/png/onboarding/three.png",
        width: 80.w,
      ),

      customText(
        text: "Save Time, Skip\nStations",
        color: whiteColor,
        fontFamily: "bl_melody",
        fontSize: 24.sp,
        textAlign: TextAlign.center,
        fontWeight: FontWeight.w700,
        height: 0.13.h,
      ),

      SizedBox(height: 2.h),

      customText(
        text:
        "Too Easy significantly reduces manual effort and saves\nvaluable time for all users.",
        color: whiteColor,
        fontSize: 15.sp,
        textAlign: TextAlign.center,
      ),

    ],
    ));
}
