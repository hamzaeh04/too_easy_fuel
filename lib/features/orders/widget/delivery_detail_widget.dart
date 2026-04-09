import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/color_constants.dart';
import '../../../widgets/button_widget.dart';
import '../../../widgets/customText_widget.dart';
import '../../setting/widgets/elevated_container.dart';

Widget deliveryDetailWidget({String? imgPath, String? title, String? subTitle}){
  return Padding(
    padding: EdgeInsets.only(bottom: 0.5.h, top: 1.h),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(imgPath ?? "", height: 2.7.h,),
        SizedBox(width: 4.w,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            customText(
              text: title,
              color: blackColor,
              fontSize: 15.5.sp,
              fontWeight: FontWeight.w600,
              letterSpacing: -0.3,
            ),
            customText(
                text: subTitle,
                fontSize: 15.5.sp,
                color: darkGreyColor,
                letterSpacing: -0.4
            )
          ],
        )
      ],
    )
  );
}
