import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/color_constants.dart';

Widget elevatedContainer({Widget? child, double? height, double? hPadding, double? vPadding, double? margin, double? radius}){
  return Container(
    margin: EdgeInsets.symmetric(horizontal: margin ?? 0.w,),
    height: height,
    width: double.infinity,
    decoration: BoxDecoration(

      borderRadius: BorderRadius.circular(radius ?? 4.w,),
      color: whiteColor,
      boxShadow: [
        BoxShadow(
          color: blackColor.withOpacity(0.08), // soft shadow
          blurRadius: 10,
          offset: Offset(0, 4), // slight lift
        ),
      ],
      border: Border.all(
        color: greyColor.withValues(alpha: 0.2), // subtle edge
      ),
    ),
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: hPadding ?? 4.w, vertical: vPadding ?? 0.h),
      child: child,
    ),
  );
}