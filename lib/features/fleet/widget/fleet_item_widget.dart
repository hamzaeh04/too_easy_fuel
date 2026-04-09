import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:too_easy_fuel/widgets/customText_widget.dart';

import '../../../constants/color_constants.dart';
import '../../setting/widgets/elevated_container.dart';

Widget fleetItem({String? imgPath, String? title, String? subTitle, String? detail, String? port}){
  return elevatedContainer(
      vPadding: 2.h,
      hPadding: 5.w,
      containerColor: whiteColor,
      radius: 18.sp,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 7.h,
            width: 15.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18.sp),
            ),
            child: Image.asset(imgPath ?? ""),
          ),
          SizedBox(width: 4.w,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customText(
                  text: title ??"Invoice",
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  fontFamily: "bl_melody",
                  letterSpacing: -0.4,
                  color: blueColor,
                  height: 1
              ),
              customText(
                  text: subTitle ??"Suzuki Cultus (2023)",
                  fontSize: 15.5.sp,
                  fontWeight: FontWeight.w400,
                  letterSpacing: -0.4,
                  color: blackColor,
              ),
              customText(
                  text: detail?? "Fuel: Electric    Tank: 82 gal",
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400,
                  letterSpacing: -0.4,
                  color: darkGreyColor,
              ),
              customText(
                text: port??"Port: left",
                fontSize: 15.sp,
                fontWeight: FontWeight.w400,
                letterSpacing: -0.4,
                color: darkGreyColor,
              ),
            ],
          ),
          Spacer(),
          Icon(Icons.keyboard_arrow_right_outlined, size: 21.5.sp,)
        ],
      )
  );
}