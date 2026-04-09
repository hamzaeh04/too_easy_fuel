import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/color_constants.dart';
import '../../../widgets/customText_widget.dart';

Widget trackOrderWidget({String? title, String? subTitle, String? imgPath, bool? step = false, bool? isLast = false}){
  return Padding(
    padding: EdgeInsets.only(bottom: isLast == true ? 0.h: 1.5.h),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              height: 5.h,
              width: 12.w,
              padding: EdgeInsets.symmetric(horizontal: 3.w),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: step == true ? blueColor: greyColor.withValues(alpha: 0.28)
              ),
              child: Image.asset(imgPath ?? "", color: step == true ? whiteColor : null,),
            ),
            // Vertical Divider
            isLast == true ? SizedBox.shrink() : Container(
              height: 4.h,
              width: 0.5.w, // thickness
                color: step == true ? blueColor: greyColor.withValues(alpha: 0.28)
            ),
          ],
        ),
        SizedBox(width: 3.w,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: step == true ? 0.7.h : 1.6.h,),
            customText(
                text: title ?? "Order Received",
                fontSize: 16.sp,
                fontFamily: "bl_melody",
                color: step == true ? blueColor: darkGreyColor,
                fontWeight: FontWeight.w400,
                letterSpacing: -0.2,
                height: 1.25
            ),
            step == true ? customText(
                text: subTitle ?? "",
                fontSize: 15.25.sp,
                color: darkGreyColor,
                fontWeight: FontWeight.w400,
                letterSpacing: -0.2,
                height: 1
            ): SizedBox.shrink(),
          ],
        )
      ],
    ),
  );
}