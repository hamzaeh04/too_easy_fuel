import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';
import 'package:too_easy_fuel/constants/color_constants.dart';
import 'package:too_easy_fuel/widgets/button_widget.dart';
import 'package:too_easy_fuel/widgets/customText_widget.dart';

Widget activeSubscription({double? margin, Color? containerClr, String? title, String? subTitle}){
  return Container(
    margin: EdgeInsets.symmetric(horizontal: margin ?? 0),
    padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.5.h),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16.sp),
      color: containerClr ?? blueColor
    ),
    child: Column(
      children: [
        Row(
          children: [
            Image.asset("assets/png/subscription_image/active_icon.png", width: 5.w,),
            SizedBox(width: 4.w,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customText(
                  text: title ?? "Weekly Plan",
                  fontSize: 18.5.sp,
                  fontWeight: FontWeight.w700,
                  color: whiteColor
                ),
                customText(
                  text: "Active Subscription",
                  fontSize: 14.5.sp,
                  fontWeight: FontWeight.w400,
                  color: whiteColor
                ),
              ],
            ),
            Spacer(),
            buttonWidget("Active", blackColor, colors: whiteColor, width: 16.w, height: 3.25.h, fontsize: 14.5.sp, fontweight: FontWeight.w400)
          ],
        ),
        SizedBox(height: 2.h,),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.25.h),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.sp),
              color: whiteColor.withValues(alpha: 0.09)
          ),
          child: Column(
            children: [
              Row(
                children: [
                  customText(
                    text: "Deliveries Used",
                      fontSize: 14.5.sp,
                      fontWeight: FontWeight.w400,
                      color: whiteColor
                  ),
                  Spacer(),
                  customText(
                      text: "2/4",
                      fontSize: 14.5.sp,
                      fontWeight: FontWeight.w400,
                      color: whiteColor
                  ),
                ],
              ),
              SizedBox(height: 0.5.h,),
              Row(
                children: [
                  customText(
                    text: "Next Billing Date",
                      fontSize: 14.5.sp,
                      fontWeight: FontWeight.w400,
                      color: whiteColor
                  ),
                  Spacer(),
                  customText(
                      text: "3/19/2026",
                      fontSize: 14.5.sp,
                      fontWeight: FontWeight.w400,
                      color: whiteColor
                  ),
                ],
              ),
              SizedBox(height: 0.5.h,),

              Row(
                children: [
                  customText(
                    text: "Monthly Cost",
                      fontSize: 14.5.sp,
                      fontWeight: FontWeight.w400,
                      color: whiteColor
                  ),
                  Spacer(),
                  customText(
                      text: "\$29.99",
                      fontSize: 14.5.sp,
                      fontWeight: FontWeight.w400,
                      color: whiteColor
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 2.h,),
        buttonWidget("Cancel Subscription", blueColor, colors: whiteColor, fontsize: 15.5.sp, fontweight: FontWeight.w500,),
        SizedBox(height: 0.5.h,),

      ],
    ),
  );
}