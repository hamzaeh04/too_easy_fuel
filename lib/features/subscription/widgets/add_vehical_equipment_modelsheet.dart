import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/color_constants.dart';
import '../../../widgets/arrow_back.dart';
import '../../../widgets/button_widget.dart';
import '../../../widgets/customText_widget.dart';
import 'add_vehical_equipment_two_modelsheet.dart';

void vehicalEquipmentBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (BuildContext context) {
      return FractionallySizedBox(
        heightFactor: 0.8,
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

                     Image.asset("assets/png/auth_image/vehical_equipment_auth.png"),
                      SizedBox(height: 2.h),
                      buttonWidget("Next", whiteColor,isGradient: true,fontsize: 15.5.sp,onTap: (){
                        vehicalEquipmentBottomSheetTwo(context);
                      }),
                      SizedBox(height: 1.h),
                      buttonWidget(
                        "Skip",
                        blueAppBarColor,
                        borderColor: blueAppBarColor,
                        fontsize: 15.5.sp,
                        onTap: (){
                          vehicalEquipmentBottomSheetTwo(context);
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
