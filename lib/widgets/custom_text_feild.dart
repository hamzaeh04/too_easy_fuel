import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:too_easy_fuel/features/auth/controller/auth_controller.dart';

import '../constants/color_constants.dart';
import 'customText_widget.dart';

Widget emailTextFeild(String title,String hinttext,String path,AuthController auth,{bool? ispassword,RxBool? isPasswordHidden,VoidCallback? onSuffixTap,Widget? suffixIcon,bool? showSuffix,bool? isPaymentScreen = false}){
  return Column(
    children: [
      Row(
        children: [
          customText(
            text:
            title,
            fontSize: 15.sp,
            textAlign: TextAlign.center,
          ),
          isPaymentScreen == true ? customText(
            text:
            "*",
            color: redAppBarColor,
            fontSize: 15.sp,
            textAlign: TextAlign.center,
          ):SizedBox.shrink(),

        ],
      ),
      SizedBox(height: 1.h),
      ispassword == true
          ? Obx(() {
              return TextField(
                obscureText: isPasswordHidden!.value,
                decoration: InputDecoration(
                  filled: true, // 🔥 IMPORTANT
                  fillColor: Colors.white, //
                  isDense: true,
                  hintText: hinttext,
                  hintStyle: TextStyle(
                    color: borderGreyColor,
                    fontFamily: "inter",
                    fontSize: 14.5.sp,
                  ),

                  contentPadding: EdgeInsets.symmetric(
                    vertical: 1.5.h,
                  ),

                  /// 🔹 PREFIX
                  prefixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(width: 3.w),
                      Image.asset(path, width: 6.w, height: 6.w),
                      SizedBox(width: 3.w),
                      Container(
                        height: 2.5.h,
                        width: 1,
                        color: borderGreyColor,
                      ),
                      SizedBox(width: 2.w),
                    ],
                  ),
                  /// 🔥 SUFFIX CONSTRAINTS
                  suffixIconConstraints: BoxConstraints(
                    minHeight: 4.3.h,
                    minWidth: 4.3.h,
                  ),

                  suffixIcon: GestureDetector(
                    onTap: () {
                      isPasswordHidden.toggle();
                    },
                    child: Padding(
                      padding: EdgeInsets.only(
                        right: 4.w, // 🔹 Add padding from right


                      ),
                      child: Obx(() => Image.asset(
                        isPasswordHidden.value
                            ? "assets/png/auth_image/field-icons-close-eye.png"
                            : "assets/png/auth_image/open-eye.png",
                        width: 4.w,
                        height: 4.w,
                      )),
                    ),
                  ),

                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24.sp),
                    borderSide: BorderSide(
                      color: borderGreyColor,
                      width: 0.15.h,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24.sp),
                    borderSide: BorderSide(
                      color: borderGreyColor,
                      width: 0.2.h,
                    ),
                  ),
                ),
              );
            })
          : TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          isDense: true,
          hintText: hinttext,
          hintStyle: TextStyle(
            color: borderGreyColor,
            fontFamily: "inter",
            fontSize: 14.5.sp,
          ),

          contentPadding: EdgeInsets.symmetric(
            vertical: 1.5.h,
          ),

          /// 🔹 PREFIX
          prefixIcon: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(width: 3.w),
              Image.asset(path, width: 6.w, height: 6.w),
              SizedBox(width: 3.w),
              Container(
                height: 2.5.h,
                width: 1,
                color: borderGreyColor,
              ),
              SizedBox(width: 2.w),
            ],
          ),

          /// 🔹 SUFFIX (OPTIONAL)
          suffixIcon: showSuffix == true
              ? GestureDetector(
            onTap: onSuffixTap,
            child: Padding(
              padding: EdgeInsets.only(right: 3.w),
              child: suffixIcon ??
                  Icon(
                    Icons.visibility,
                    color: borderGreyColor,
                    size: 5.w,
                  ),
            ),
          )
              : null,

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24.sp),
            borderSide: BorderSide(
              color: borderGreyColor,
              width: 0.15.h,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24.sp),
            borderSide: BorderSide(
              color: borderGreyColor,
              width: 0.2.h,
            ),
          ),
        ),
      )

    ],
  );

}
Widget customTextField(String title, String hinttext, {String? path, bool? isPass = false, required RxBool isObscure, Icon? suffix, VoidCallback? onSuffixTap}){
  return Column(
    children: [
      Row(
        children: [
          customText(
            text:
            title,
            fontSize: 15.sp,
            textAlign: TextAlign.center,
          ),
          customText(
            text:
            "*",
            color: redAppBarColor,
            fontSize: 15.sp,
            textAlign: TextAlign.center,
          ),

        ],
      ),
      SizedBox(height: 0.5.h,),
      TextField(
        style: TextStyle(
          color: blackColor,
          fontFamily: "inter",
        ),
        decoration: InputDecoration(
          filled: true, // 🔥 IMPORTANT
          fillColor: Colors.white, //
          isDense: true,
          hintText: hinttext,

          hintStyle: TextStyle(
              color: darkGreyColor,
              fontFamily: "inter",
              fontSize: 15.sp),

          contentPadding: EdgeInsets.symmetric(
              vertical: 1.5.h,
              horizontal: 4.w
          ),

          /// 🔹 PREFIX IMAGE + DIVIDER\
          prefixIcon: path != null ? Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(width: 4.w),
              Image.asset(path ?? "", width: 6.w, height: 5.w),

              SizedBox(width: 2.w),
            ],
          ): null,

          suffixIconConstraints: BoxConstraints(
            minHeight: 4.3.h,
            minWidth: 4.3.h,
          ),


          suffixIcon: suffix != null
              ? InkWell(
            onTap: onSuffixTap,
            child: Padding(
              padding: EdgeInsets.only(right: 4.w),
              child: suffix, // 👈 your custom icon
            ),
          )
              : isPass == true
              ? GestureDetector(
            onTap: () {
              isObscure.toggle(); // 👈 toggle
            },
            child: Padding(
              padding: EdgeInsets.only(right: 4.w),
              child: Obx(() => Image.asset(
                isObscure.value
                    ? "assets/png/auth_image/field-icons-close-eye.png"
                    : "assets/png/auth_image/open-eye.png",
                width: 4.w,
                height: 4.w,
              )),
            ),
          )
              : null,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24.sp),
            borderSide: BorderSide(
              color: borderGreyColor,
              width: 0.15.h,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24.sp),
            borderSide: BorderSide(
              color: borderGreyColor,
              width: 0.2.h,
            ),
          ),
        ),
      ),
    ],
  );
}
