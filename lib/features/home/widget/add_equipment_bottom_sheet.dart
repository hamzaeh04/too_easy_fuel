import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:too_easy_fuel/constants/color_constants.dart';
import 'package:too_easy_fuel/features/fleet/controller/fleet_controller.dart';
import 'package:too_easy_fuel/features/navbar/controller/navbar_controller.dart';
import 'package:too_easy_fuel/widgets/customText_widget.dart';
import 'package:too_easy_fuel/widgets/custom_dialog_widget.dart';
import 'package:too_easy_fuel/widgets/custom_text_feild.dart';
import 'package:too_easy_fuel/widgets/button_widget.dart';

void showAddEquipmentBottomSheet(BuildContext context) {
  final FleetController fleetController = Get.find<FleetController>();
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
                      text: "Add Equipment",
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
                                text: "Upload Equipment Image ",
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
                        Stack(
                          children: [
                            InkWell(
                              onTap: (){
                                fleetController.pickImage();
                              },
                              child: Container(
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
                                child: Obx(() {
                                  final file = fleetController.imageFile.value;

                                  return file == null
                                      ? Center(
                                    child: Container(
                                      height: 5.h,
                                      width: 5.h,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: blueColor,
                                      ),
                                      child: Icon(
                                        Icons.camera_alt_outlined,
                                        color: whiteColor,
                                        size: 18.sp,
                                      ),
                                    ),
                                  )
                                      : ClipRRect(
                                    borderRadius: BorderRadius.circular(18.sp),
                                    child: Image.file(
                                      File(file.path),
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                      height: 15.h,
                                    ),
                                  );
                                }),
                              ),
                            ),

                            Positioned(
                                top: 0.9.h,
                                right: 3.w,
                                child: InkWell(
                                    onTap: (){
                                      fleetController.clearImage();
                                    },
                                    child: Obx((){
                                      final file = fleetController.imageFile.value;

                                      return file == null ?
                                      SizedBox.shrink():
                                      Icon(Icons.delete, color: redColor,);
                                    })))
                          ],
                        ),

                        SizedBox(height: 2.h),
                        customTextField(controller: fleetController.equipmentTypeController, "Equipment Type", "Enter Type (e.g., Generator, Mower)", isObscure: false.obs),
                        SizedBox(height: 2.h),
                        customTextField(controller: fleetController.modelController, "Model", "Enter Model (e.g., Honda, John Deere)", isObscure: false.obs),
                        SizedBox(height: 2.h),
                        customTextField(controller: fleetController.fuelTypeController, "Fuel Type", "Enter Fuel Type (e.g., Gas, Diesel)", isObscure: false.obs),
                        SizedBox(height: 2.h),
                        customTextField(controller: fleetController.tankSizeController, "Tank Size (Gallons)", "Enter Size (e.g., 15, 20)", isObscure: false.obs,),
                        SizedBox(height: 4.h),
                        buttonWidget("Add Equipment", whiteColor, isGradient: true, onTap: (){
                          fleetController.addEquipment(
                              equipmentImage: fleetController.imageFile.value != null
                                  ? File(fleetController.imageFile.value!.path)
                                  : null,
                              context: context
                          );
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
                  onTap: () {
                    Get.back();
                    fleetController.clearImage();
                  },
                  child: Icon(Icons.cancel_outlined, size: 21.sp,)
              ),)

          ],
        )
      );
    },
  );
}
