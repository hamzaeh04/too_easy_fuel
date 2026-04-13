import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/color_constants.dart';
import '../../../widgets/arrow_back.dart';
import '../../../widgets/button_widget.dart';
import '../../../widgets/customText_widget.dart';

void vehicalEquipmentBottomSheetTwo(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (BuildContext context) {
      return FractionallySizedBox(
        heightFactor: 0.65,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              /// 🔹 Top Section (Stack ONLY for close icon)
              Stack(
                children: [
                  Padding(
                      padding: EdgeInsets.all(16),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          arrowBack(),

                          SizedBox(width: 3.w),

                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                customText(
                                  text: "Add Vehicle & Equipment",
                                  color: blueAppBarColor,
                                  fontFamily: "bl_melody",
                                  fontSize: 17.5.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                                SizedBox(height: 0.3.h),
                                customText(
                                  text:
                                  "Multiple Fleet Management",
                                  fontSize: 15.sp,
                                  textAlign: TextAlign.center,
                                ),
                                // 👉 You can add more widgets here
                                // SizedBox(height: 0.5.h),
                                // customText(text: "Subtitle", ...),
                              ],
                            ),
                          ),
                        ],
                      )
                  ),

                  /// Close Icon (top right)
                  Positioned(
                    top: 1.h,
                    right: 2.5.w,
                    child: InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(
                        Icons.cancel_outlined,
                        size: 21.sp,
                      ),
                    ),
                  ),
                ],
              ),

              /// 🔹 Content Area
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: Column(
                    children: [

                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: whiteColor,
                          border: Border.all(
                            color: blackColor.withValues(alpha: 0.12),
                            width: 0.25.w,
                          ),
                          borderRadius: BorderRadius.circular(17.sp),

                          /// 🔥 ADD THIS
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.08), // light shadow
                              blurRadius: 8,  // softness
                              spreadRadius: 1, // slight spread
                              offset: Offset(0, 3), // shadow below
                            ),
                          ],
                        ),

                        child: Center(
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 4.h),
                                child: Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12.sp),
                                        color: blueLightColor.withAlpha(20)
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(2.5.w),
                                        child: Image.asset("assets/png/auth_image/truck_image.png",width: 8.w),
                                      ),
                                    ),
                                    SizedBox(height: 1.h),
                                    customText(
                                      text: "Vehicle",
                                      color: blueAppBarColor,
                                      fontFamily: "bl_melody",
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w700,
                                      height: 0.13.h,
                                    ),
                                    SizedBox(height: 1.h),
                                    customText(
                                      text:
                                      "Add a car, truck, van, or motorcycle",
                                      fontSize: 15.sp,
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 2.h),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: whiteColor,
                          border: Border.all(
                            color: blackColor.withValues(alpha: 0.12),
                            width: 0.25.w,
                          ),
                          borderRadius: BorderRadius.circular(17.sp),

                          /// 🔥 ADD THIS
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.08), // light shadow
                              blurRadius: 8,  // softness
                              spreadRadius: 1, // slight spread
                              offset: Offset(0, 3), // shadow below
                            ),
                          ],
                        ),

                        child: Center(
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 4.h),
                                child: Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(12.sp),
                                          color: blueLightColor.withAlpha(20)
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(2.5.w),
                                        child: Image.asset("assets/png/auth_image/truck_image.png",width: 8.w),
                                      ),
                                    ),
                                    SizedBox(height: 1.h),
                                    customText(
                                      text: "Equipment",
                                      color: blueAppBarColor,
                                      fontFamily: "bl_melody",
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w700,
                                      height: 0.13.h,
                                    ),
                                    SizedBox(height: 1.h),
                                    customText(
                                      text:
                                      "Add machinery, generators, or other equipment",
                                      fontSize: 15.sp,
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 2.h),
                      buttonWidget(
                        "Skip",
                        blueAppBarColor,
                        borderColor: blueAppBarColor,
                        fontsize: 15.5.sp,
                        onTap: (){

                        }
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
