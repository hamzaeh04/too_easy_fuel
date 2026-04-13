import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:too_easy_fuel/constants/color_constants.dart';
import 'package:too_easy_fuel/widgets/customText_widget.dart';
import 'package:too_easy_fuel/widgets/button_widget.dart';
import 'package:too_easy_fuel/widgets/custom_text_feild.dart';

void fuel_2_bottomsheet(BuildContext context) {
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
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () => Get.back(),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 3.w),
                        height: 5.h,
                        width: 12.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: greyColor.withValues(alpha: 0.15),
                        ),
                        child: Image.asset('assets/png/arrow_back.png', color: blackColor),
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
                        // Search Bar
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 0.h),
                          decoration: BoxDecoration(
                            color: whiteColor,
                            borderRadius: BorderRadius.circular(20.sp),
                            border: Border.all(color: greyColor.withValues(alpha: 0.5)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.08),
                                blurRadius: 10,
                                offset: Offset(0, 4),
                              ),
                            ],
                          ),
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
                        SizedBox(height: 3.h),

                        // Custom exact Calendar UI
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.5.h),
                          decoration: BoxDecoration(
                            color: whiteColor,
                            borderRadius: BorderRadius.circular(15.sp),
                            border: Border.all(color: greyColor.withValues(alpha: 0.5)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.08),
                                blurRadius: 10,
                                offset: Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              // Header
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  customText(
                                    text: "December 2016",
                                    fontSize: 16.sp,
                                    color: blueColor.withValues(alpha: 0.85),
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "inter",
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 0.5.h),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: greyColor.withValues(alpha: 0.08),
                                        ),
                                        child: Icon(Icons.arrow_back_ios_new, size: 17.sp, color: greyColor.withValues(alpha: 0.65)),
                                      ),
                                      SizedBox(width: 2.w),
                                      Container(
                                        padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 0.5.h),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: greyColor.withValues(alpha: 0.08),
                                        ),
                                        child: Icon(Icons.arrow_forward_ios, size: 17.sp, color: greyColor.withValues(alpha: 0.65)),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(height: 3.h),
                              // Weekdays
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: ['S', 'M', 'T', 'W', 'T', 'F', 'S'].map((day) => Expanded(
                                  child: Center(
                                    child: customText(
                                      text: day,
                                      fontSize: 15.sp,
                                      color: greyColor.withValues(alpha: 0.8),
                                      fontFamily: "inter",
                                    )
                                  )
                                )).toList(),
                              ),
                              SizedBox(height: 2.h),
                              // Grid
                              GridView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: 35, // 5 rows * 7
                                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 7,
                                  childAspectRatio: 1.05,
                                ),
                                itemBuilder: (context, index) {
                                  List<int> dates = [
                                    27, 28, 29, 30, 1, 2, 3, 
                                    4, 5, 6, 7, 8, 9, 10,
                                    11, 12, 13, 14, 15, 16, 17,
                                    18, 19, 20, 21, 22, 23, 24,
                                    25, 26, 27, 28, 29, 30, 31
                                  ];
                                  bool isPreviousMonth = index < 4;
                                  bool isSelected = index == 9; // corresponds to 6
                                  
                                  return Center(
                                    child: Container(
                                      width: double.infinity,
                                      height: double.infinity,
                                      margin: EdgeInsets.all(2.sp),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: isSelected ? blueColor : Colors.transparent,
                                      ),
                                      child: Center(
                                        child: customText(
                                          text: dates[index].toString(),
                                          fontSize: 15.sp,
                                          color: isSelected 
                                            ? whiteColor 
                                            : (isPreviousMonth ? greyColor.withValues(alpha: 0.3) : darkGreyColor.withValues(alpha: 0.85)),
                                          fontFamily: "inter",
                                        ),
                                      ),
                                    ),
                                  );
                                }
                              ),
                            ],
                          )
                        ),
                        SizedBox(height: 3.h),
                        customTextField("Select Time Slot", "Select Time Slot Between 09:00 AM To 05:00 PM", isObscure: false.obs, suffix: Icon(Icons.keyboard_arrow_down)),
                        SizedBox(height: 5.h),

                        // Done Button
                        buttonWidget("Done", whiteColor, isGradient: true, onTap: (){
                          Get.back();
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
