import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:too_easy_fuel/constants/color_constants.dart';
import 'package:too_easy_fuel/features/fleet/widget/fuel_2_bottomsheet.dart';
import 'package:too_easy_fuel/features/fleet/widget/fuel_3_bottomsheet.dart';
import 'package:too_easy_fuel/features/setting/widgets/elevated_container.dart';
import 'package:too_easy_fuel/widgets/customText_widget.dart';
import 'package:too_easy_fuel/widgets/custom_text_feild.dart';
import 'package:too_easy_fuel/widgets/button_widget.dart';

import '../../../widgets/custom_dialog_widget.dart';

void fuelBottomSheet1(BuildContext context) {
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
                        text: "Schedule A Fuel Up",
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
                          customTextField("Delivery Address", "Enter Delivery Address", isObscure: false.obs),
                          SizedBox(height: 2.h),
                          customTextField("Vehicle & Equipment", "Enter Type (e.g., Vehicle or Equipment)", isObscure: false.obs),
                          SizedBox(height: 2.h),
                          customTextField("Fuel Type", "Enter Fuel Type (e.g., Gas, Diesel)", isObscure: false.obs),
                          SizedBox(height: 2.h),
                          customTextField("Order Quantity (Gallons)", "Enter Size (e.g., 15, 20)", isObscure: false.obs,),
                          SizedBox(height: 2.h),
                          customTextField("Time Slot", "Enter Time & Date", isObscure: false.obs, suffix: Icon(Icons.calendar_today_outlined), onSuffixTap: (){
                            fuel_2_bottomsheet(context);
                            print("kk");
                          }),
                          SizedBox(height: 2.h),
                          customTextField("Promo Code", "Enter Promo Code (If Available)", isObscure: false.obs,),
                          SizedBox(height: 4.h),
                          buttonWidget("Proceed to Checkout", whiteColor, isGradient: true, onTap: (){
                            fuel_3_bottomsheet(context);
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
