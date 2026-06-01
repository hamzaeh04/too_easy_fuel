import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:too_easy_fuel/constants/color_constants.dart';
import 'package:too_easy_fuel/features/fleet/controller/fleet_controller.dart';
import 'package:too_easy_fuel/features/fleet/widget/fuel_2_bottomsheet.dart';
import 'package:too_easy_fuel/features/fleet/widget/fuel_3_bottomsheet.dart';
import 'package:too_easy_fuel/features/setting/widgets/elevated_container.dart';
import 'package:too_easy_fuel/widgets/customText_widget.dart';
import 'package:too_easy_fuel/widgets/custom_text_feild.dart';
import 'package:too_easy_fuel/widgets/button_widget.dart';

import '../../../widgets/custom_dialog_widget.dart';

void fuelBottomSheet1(BuildContext context) {
  FleetController controller = Get.put(FleetController());
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
                                color: greyColor.withValues(alpha: 0.2),
                                borderRadius: BorderRadius.circular(16.sp),
                                border: Border.all(color: greyColor.withValues(alpha: 0.25))
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: whiteColor,
                                  borderRadius: BorderRadius.circular(20.sp),
                                  border: Border.all(color: greyColor.withValues(alpha: 0.5))
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
                          customTextField("Vehicle & Equipment", "Enter Type (e.g., Vehicle or Equipment)", isObscure: false.obs, suffix: Icon(Icons.keyboard_arrow_down_outlined, size: 20.sp,)),
                          SizedBox(height: 2.h),
                          Row(
                            children: [
                              Obx(() => GestureDetector(
                                onTap: () {
                                  controller.isChecked.toggle();
                                },
                                child: Container(
                                  height: 2.h,
                                  width: 4.4.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.sp),
                                    border: Border.all(
                                      color: blueAppBarColor,
                                      width: 0.22.w,
                                    ),
                                    color: controller.isChecked.value
                                        ? blueAppBarColor.withOpacity(0.9)
                                        : Colors.transparent,
                                  ),

                                  /// 🔥 ADD THIS
                                  child: controller.isChecked.value
                                      ? Center(
                                    child: Icon(
                                      Icons.check,
                                      color: Colors.white,
                                      size: 14.sp,
                                    ),
                                  )
                                      : null,
                                ),
                              )),
                              SizedBox(width: 2.w),
                              customText(
                                text:
                                "Add a vehicle or Add a Equipment",
                                fontSize: 15.sp,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          SizedBox(height: 2.h),
                          // Obx((){
                          //   return controller.isChecked.value == true ?
                          //       Container(
                          //         padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.5.h),
                          //         decoration: BoxDecoration(
                          //           borderRadius: BorderRadius.circular(15.sp),
                          //           color: greyColor.withValues(alpha: 0.2),
                          //           border: Border.all(color: greyColor.withValues(alpha: 0.25))
                          //         ),
                          //         child: Column(
                          //           children: [
                          //             customTextField("Vehicle & Equipment", "Enter Type (e.g., Vehicle or Equipment)", isObscure: false.obs, suffix: Icon(Icons.keyboard_arrow_down_outlined, size: 20.sp,)),
                          //             SizedBox(height: 2.h),
                          //             customTextField("Fuel Type", "Enter Fuel Type (e.g., Gas, Diesel)", isObscure: false.obs, suffix: Icon(Icons.keyboard_arrow_down_outlined, size: 20.sp,)),
                          //             SizedBox(height: 2.h),
                          //             customTextField("Quantity", "Enter Quantity", isObscure: false.obs,),
                          //             SizedBox(height: 2.h),
                          //             Row(
                          //               children: [
                          //                 GestureDetector(
                          //                   onTap: () {
                          //                     controller.isChecked1.toggle();
                          //                   },
                          //                   child: Container(
                          //                     height: 2.h,
                          //                     width: 4.4.w,
                          //                     decoration: BoxDecoration(
                          //                       borderRadius: BorderRadius.circular(8.sp),
                          //                       border: Border.all(
                          //                         color: blueAppBarColor,
                          //                         width: 0.22.w,
                          //                       ),
                          //                       color: controller.isChecked1.value
                          //                           ? blueAppBarColor.withOpacity(0.9)
                          //                           : Colors.transparent,
                          //                     ),
                          //
                          //                     /// 🔥 ADD THIS
                          //                     child: controller.isChecked1.value
                          //                         ? Center(
                          //                       child: Icon(
                          //                         Icons.check,
                          //                         color: Colors.white,
                          //                         size: 14.sp,
                          //                       ),
                          //                     )
                          //                         : null,
                          //                   ),
                          //                 ),
                          //                 SizedBox(width: 2.w),
                          //                 customText(
                          //                   text:
                          //                   "Add a vehicle or Add a Equipment",
                          //                   fontSize: 15.sp,
                          //                   textAlign: TextAlign.center,
                          //                 ),
                          //               ],
                          //             ),
                          //           ],
                          //         ),
                          //       ): SizedBox.shrink();
                          // }),

                      Obx(() {
                        return controller.isChecked.value
                            ? Container(
                          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.5.h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.sp),
                            color: greyColor.withValues(alpha: 0.2),
                            border: Border.all(color: greyColor.withValues(alpha: 0.25)),
                          ),
                          child: Column(
                            children: [
                              customTextField(
                                "Vehicle & Equipment",
                                "Enter Type (e.g., Vehicle or Equipment)",
                                isObscure: false.obs,
                                suffix: Icon(Icons.keyboard_arrow_down_outlined, size: 20.sp),
                              ),
                              SizedBox(height: 2.h),

                              customTextField(
                                "Fuel Type",
                                "Enter Fuel Type (e.g., Gas, Diesel)",
                                isObscure: false.obs,
                                suffix: Icon(Icons.keyboard_arrow_down_outlined, size: 20.sp),
                              ),
                              SizedBox(height: 2.h),

                              customTextField(
                                "Quantity",
                                "Enter Quantity",
                                isObscure: false.obs,
                              ),
                              SizedBox(height: 2.h),

                              /// ✅ Checkbox Row
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      controller.showExtraFields.toggle(); // 👈 only one variable
                                    },
                                    child: Container(
                                      height: 2.h,
                                      width: 4.4.w,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8.sp),
                                        border: Border.all(
                                          color: blueAppBarColor,
                                          width: 0.22.w,
                                        ),
                                        color: controller.showExtraFields.value
                                            ? blueAppBarColor.withOpacity(0.9)
                                            : Colors.transparent,
                                      ),
                                      child: controller.showExtraFields.value
                                          ? Center(
                                        child: Icon(
                                          Icons.check,
                                          color: Colors.white,
                                          size: 14.sp,
                                        ),
                                      )
                                          : null,
                                    ),
                                  ),
                                  SizedBox(width: 2.w),
                                  customText(
                                    text: "Add another Vehicle/Equipment",
                                    fontSize: 15.sp,
                                  ),
                                ],
                              ),

                              /// ✅ Extra Fields (inside same container)
                              Obx(() {
                                return controller.showExtraFields.value
                                    ? Column(
                                  children: [
                                    SizedBox(height: 2.h),
                                    customTextField(
                                      "Vehicle & Equipment",
                                      "Enter Type",
                                      isObscure: false.obs,
                                    ),
                                    SizedBox(height: 2.h),
                                    customTextField(
                                      "Fuel Type",
                                      "Enter Fuel Type",
                                      isObscure: false.obs,
                                    ),
                                    SizedBox(height: 2.h),
                                    customTextField(
                                      "Quantity",
                                      "Enter Quantity",
                                      isObscure: false.obs,
                                    ),
                                  ],
                                )
                                    : SizedBox.shrink();
                              }),
                            ],
                          ),
                        )
                            : SizedBox.shrink();
                      }),
                          SizedBox(height: 2.h),
                          customTextField("Fuel Type", "Enter Fuel Type (e.g., Gas, Diesel)", isObscure: false.obs, suffix: Icon(Icons.keyboard_arrow_down_outlined, size: 20.sp,)),
                          SizedBox(height: 2.h),
                          customTextField("Order Quantity (Gallons)", "Enter Size (e.g., 15, 20)", isObscure: false.obs,),
                          SizedBox(height: 2.h),
                          customTextField("Time Slot", "Enter Time & Date", isObscure: false.obs, suffix: Image.asset("assets/png/calendar.png", width: 4.w,), onSuffixTap: (){
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
