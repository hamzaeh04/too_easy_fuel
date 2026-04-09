import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:too_easy_fuel/widgets/customText_widget.dart';

import '../../../constants/color_constants.dart';


Widget menu(
    String title, {
      String? imagePath,
      VoidCallback? ontap,
      double? fontSize,
      Color? color,
      bool? isIcon = false,
      IconData? icon,
    }) {
  return InkWell(
    onTap: ontap,
    borderRadius: BorderRadius.circular(4.w),
    child: Container(
      margin: EdgeInsets.symmetric(horizontal: 5.w),
      height: 9.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.w),
        color: whiteColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
        border: Border.all(
          color: greyColor.withOpacity(0.2),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        child: Row(
          children: [
            // Icon/Image
            if (isIcon == false)
              Container(
                padding: EdgeInsets.symmetric(horizontal: 3.25.w),
                height: 5.7.h,
                width: 13.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3.5.w),
                  color: color,
                ),
                child: Image.asset(imagePath ?? ""),
              )
            else
              Icon(icon, color: greyColor, size: 20.sp),

            SizedBox(width: isIcon == true ? 2.w : 4.w),

            // Text takes remaining space
            Expanded(
              child: customText(
                text: title,
                fontSize: fontSize ?? 16.5.sp,
                overFlow: TextOverflow.ellipsis,
                letterSpacing: -0.5,
              ),
            ),

            // Trailing arrow
            Icon(
              Icons.keyboard_arrow_right_rounded,
              size: 22.sp,
              color: greyColor.withOpacity(0.7),
            ),
          ],
        ),
      ),
    ),
  );
}
