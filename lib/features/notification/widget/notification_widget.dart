import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/color_constants.dart';
import '../../../widgets/customText_widget.dart';

Widget notificationWidget(
    String message, {
      required String time,
      required String date,
      bool isRead = false,
      String? title,
      VoidCallback? onReadTap,
    }) {
  return Container(
    margin: EdgeInsets.only(bottom: 1.25.h),
    decoration: BoxDecoration(
      color: isRead ? redAppBarColor.withOpacity(0.04): whiteColor,
      border: Border.all(
        color: isRead ? redAppBarColor.withOpacity(0.25): greyColor.withValues(alpha: 0.25),
        width: isRead ? 0.1.w : 0.2.w,
      ),
      borderRadius: BorderRadius.circular(15.sp),
    ),
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.5.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          customText(
            text:
            message ??
                'Sed rhoncus sapien nunc eget odio. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean euismod bibendum laoreet. Proin gravida dolor sit amet lacus accumsan et viverra justo commodo.',
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: blackColor,
          ),
          SizedBox(height: 0.5.h),

          // ✅ Action & Time Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: onReadTap,
                child: customText(
                  text: 'Mark As Read',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                  color: isRead ? redAppBarColor: darkGreyColor,
                  txtDecoration: TextDecoration.underline,
                  decorationColor: isRead ? redAppBarColor: darkGreyColor,
                ),
              ),

              Row(
                children: [
                  Row(
                    children: [
                      Image.asset(
                        "assets/png/clock.png",
                        width: 3.5.w,
                      ),
                      SizedBox(width: 1.w),
                      customText(
                        text: "${time}" ?? '12:45 PM',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: darkGreyColor,
                      ),
                    ],
                  ),
                  SizedBox(width: 2.w),
                  Row(
                    children: [
                      Image.asset(
                        "assets/png/calendar.png",
                        width: 3.5.w,
                      ),
                      SizedBox(width: 1.w),
                      customText(
                        text: date ?? '20 June 2025',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: darkGreyColor,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
