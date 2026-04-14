import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:too_easy_fuel/constants/color_constants.dart';
import 'package:too_easy_fuel/features/setting/widgets/elevated_container.dart';
import 'package:too_easy_fuel/widgets/customText_widget.dart';
import 'package:too_easy_fuel/widgets/custom_text_feild.dart';
import 'package:too_easy_fuel/widgets/button_widget.dart';

import '../../../widgets/custom_dialog_widget.dart';

void showAddVehicleBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return Container(
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8.w),
            topRight: Radius.circular(8.w),
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
        height: 85.h,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: (){
                        Get.back();
                        print("back");
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 3.5.w),
                        height: 5.h,
                        width: 12.w,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: greyColor.withValues(alpha: 0.15)
                        ),
                        child: Image.asset('assets/png/arrow_back.png', color: blackColor,),
                      ),
                    ),
                    SizedBox(width: 4.w),
                    customText(
                      text: "Add a Vehicle",
                      fontSize: 18.5.sp,
                      color: blueColor,
                      fontWeight: FontWeight.w800,
                      fontFamily: "bl_melody",
                    ),

                  ],
                ),
                SizedBox(height: 3.h),
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Search bar
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                          decoration: BoxDecoration(
                              color: greyColor.withValues(alpha: 0.15),
                              borderRadius: BorderRadius.circular(16.sp),
                              border: Border.all(color: greyColor.withValues(alpha: 0.2))
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                                color: whiteColor,
                                borderRadius: BorderRadius.circular(20.sp),
                                border: Border.all(color: greyColor.withValues(alpha: 0.25))
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 0.h),
                            child: Row(
                              children: [
                                Icon(Icons.search, color: greyColor, size: 18.sp),
                                SizedBox(width: 2.w),
                                Expanded(
                                  child: TextField(
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Search",
                                      hintStyle: TextStyle(
                                        color: greyColor,
                                        fontFamily: "inter",
                                        fontSize: 15.sp,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 2.h),
                        Row(
                          children: [
                            customText(
                                text: "Upload Vehicle Image ",
                                fontSize: 15.sp,
                                color: blackColor,
                                fontFamily: "inter",
                                letterSpacing: -0.4
                            ),
                            customText(
                              text: "(Optional)",
                              fontSize: 14.5.sp,
                              color: darkGreyColor,
                              fontFamily: "inter",
                            ),
                          ],
                        ),
                        SizedBox(height: 1.h),
                        Container(
                          height: 15.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: whiteColor,
                              borderRadius: BorderRadius.circular(18.sp),
                              border: Border.all(color: greyColor.withValues(alpha: 0.45)),
                              boxShadow: [
                                BoxShadow(
                                  color: blackColor.withOpacity(0.04),
                                  blurRadius: 10,
                                  offset: Offset(0, 4),
                                ),
                              ]
                          ),
                          child: Center(
                            child: Container(
                              height: 5.h,
                              width: 5.h,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: blueColor,
                              ),
                              child: Icon(Icons.camera_alt_outlined, color: whiteColor, size: 18.sp),
                            ),
                          ),
                        ),
                        SizedBox(height: 2.h),
                        customTextField("Make", "Enter Vehicle Make (e.g., Toyota, Ford)", isObscure: false.obs),
                        SizedBox(height: 2.h),
                        customTextField("Model", "Enter Vehicle Model (e.g., RAV4, F-150)", isObscure: false.obs),
                        SizedBox(height: 2.h),
                        customTextField("Fuel Type", "Enter Fuel Type (e.g., Gas, Diesel)", isObscure: false.obs),
                        SizedBox(height: 2.h),
                        customTextField("Tank Size (Gallons)", "Enter Size (e.g., 15, 20)", isObscure: false.obs,),
                        SizedBox(height: 2.h),
                        customTextField("Tank Size (Gallons)", "Right, Left", isObscure: false.obs,),
                        SizedBox(height: 4.h),
                        buttonWidget("Add Vehicle", whiteColor, isGradient: true, onTap: (){
                          customDialog(context, title: "Vehicle added successfully!", btnText: "Ok");

                        }),
                        SizedBox(height: 4.h),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              right: 0.w,
              child: InkWell(
                onTap: () => Get.back(),
                child: Icon(Icons.cancel_outlined, size: 21.sp,)
            ),)
          ],
        )
      );
    },
  );
}
