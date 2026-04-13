import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:too_easy_fuel/features/home/controller/home_controller.dart';
import 'package:too_easy_fuel/widgets/app_bar_widget.dart';
import 'package:too_easy_fuel/widgets/background_widget.dart';
import 'package:too_easy_fuel/features/setting/widgets/elevated_container.dart';
import '../../../constants/color_constants.dart';
import '../../../widgets/customText_widget.dart';
import 'package:too_easy_fuel/constants/app_images.dart';

import '../widget/add_equipment_bottom_sheet.dart';
import '../widget/add_vehicle_bottom_sheet.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: radialBackground(
        child: Column(
          children: [
            appBar("Josh elbert", isHome: true),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: Column(
                    children: [
                      SizedBox(height: 2.h),
                      // Schedule Fuel Up
                      elevatedContainer(
                        vPadding: 1.5.h,
                        hPadding: 4.5.w,
                        gradient: LinearGradient(
                          colors: [blueColor, Color(0xFF5D364A)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            customText(
                              text: "Schedule Fuel Up",
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                              color: whiteColor,
                              fontFamily: 'bl_melody',
                            ),
                            customText(
                              text: "A smarter way to stay energized—schedule your\nfuel-ups and never miss a boost",
                              fontSize: 14.5.sp,
                              fontWeight: FontWeight.w400,
                              color: offWhiteColor,
                              fontFamily: 'inter',
                              height: 1.3,
                              letterSpacing: -0.4
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 1.5.h),

                      // Time Saved
                      elevatedContainer(
                        vPadding: 1.25.h,
                        hPadding: 4.5.w,
                        gradient: LinearGradient(
                          colors: [lightBlueColor, Color(0xFFEFF6FF)],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                        borderColor: lightBlueColor,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            customText(
                              text: "Time Saved",
                              fontSize: 14.5.sp,
                              fontWeight: FontWeight.w500,
                              color: blackColor,
                              fontFamily: 'inter',
                            ),
                            SizedBox(height: 0.5.h),
                            customText(
                              text: "5 Hours 24 Minutes",
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w700,
                              color: blueColor,
                              fontFamily: 'bl_melody',
                              letterSpacing: -0.4
                            ),
                            SizedBox(height: 0.25.h),
                            customText(
                              text: "You've saved 24 minutes by using\nToo Easy Fuel",
                              fontSize: 14.5.sp,
                              fontWeight: FontWeight.w400,
                              color: blackColor,
                              fontFamily: 'inter',
                              height: 1.3,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 1.5.h),

                      // Upcoming Booking
                      elevatedContainer(
                        vPadding: 1.25.h,
                        hPadding: 4.5.w,
                        containerColor: whiteColor,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                customText(
                                  text: "Upcoming Booking",
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w700,
                                  color: blueColor,
                                  fontFamily: 'bl_melody',
                                ),
                                customText(
                                  text: "View All",
                                  fontSize: 14.5.sp,
                                  fontWeight: FontWeight.w500,
                                  color: redAppBarColor,
                                  fontFamily: 'inter',
                                  txtDecoration: TextDecoration.underline,
                                  decorationColor: redAppBarColor
                                ),
                              ],
                            ),
                            customText(
                              text: "Next fuel delivery",
                              fontSize: 14.5.sp,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'inter',
                            ),
                            SizedBox(height: 1.5.h),
                            customText(
                              text: "Order # 1568",
                              fontSize: 14.5.sp,
                              fontWeight: FontWeight.w500,
                              color: blackColor,
                              fontFamily: 'inter',
                            ),
                            SizedBox(height: 1.h),
                            Row(
                              children: [
                                Icon(Icons.calendar_today_outlined, size: 18.sp, color: greyColor),
                                SizedBox(width: 2.w),
                                customText(
                                  text: "Tue, Feb 10",
                                  fontSize: 14.5.sp,
                                  color: blackColor,
                                  fontFamily: 'inter',
                                ),
                              ],
                            ),
                            SizedBox(height: 1.h),
                            Row(
                              children: [
                                Icon(Icons.access_time_outlined, size: 18.sp, color: greyColor),
                                SizedBox(width: 2.w),
                                customText(
                                  text: "09:00 AM - 09:30 AM",
                                  fontSize: 14.5.sp,
                                  color: blackColor,
                                  fontFamily: 'inter',
                                ),
                              ],
                            ),
                            SizedBox(height: 1.h),
                            Row(
                              children: [
                                Icon(Icons.local_gas_station_outlined, size: 18.sp, color: greyColor),
                                SizedBox(width: 2.w),
                                customText(
                                  text: "Quantity: 20L",
                                  fontSize: 14.5.sp,
                                  color: blackColor,
                                  fontFamily: 'inter',
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 1.5.h),

                      // Subscription Status
                      elevatedContainer(
                        vPadding: 1.5.h,
                        hPadding: 4.5.w,
                        containerColor: lightGreenColor,
                        borderColor: Colors.transparent,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            customText(
                              text: "Subscription Status",
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w700,
                              color: blueColor,
                              fontFamily: 'bl_melody',
                            ),
                            SizedBox(height: 0.5.h),
                            Row(
                              children: [
                                Icon(Icons.calendar_today_outlined, size: 18.sp, color: greyColor),
                                SizedBox(width: 2.w),
                                customText(
                                  text: "Plan: Weekly Plan",
                                  fontSize: 14.5.sp,
                                  color: blackColor,
                                  fontFamily: 'inter',
                                ),
                              ],
                            ),
                            SizedBox(height: 1.h),
                            Row(
                              children: [
                                Icon(Icons.calendar_today_outlined, size: 18.sp, color: greyColor),
                                SizedBox(width: 2.w),
                                customText(
                                  text: "Valid Till: Tue, Feb 10",
                                  fontSize: 14.5.sp,
                                  color: blackColor,
                                  fontFamily: 'inter',
                                ),
                              ],
                            ),
                            SizedBox(height: 1.h),
                            Row(
                              children: [
                                Icon(Icons.check_circle_outline, size: 18.sp, color: neonGreenColor),
                                SizedBox(width: 2.w),
                                customText(
                                  text: "Status: Active",
                                  fontSize: 14.5.sp,
                                  color: blackColor,
                                  fontFamily: 'inter',
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 2.h),

                      // Fleet Management
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                elevatedContainer(
                                  vPadding: 2.h,
                                  hPadding: 4.w,
                                  containerColor: whiteColor,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(12.sp),
                                        decoration: BoxDecoration(
                                          color: neonGreenColor.withValues(alpha: 0.1), // light green accent
                                          shape: BoxShape.circle,
                                        ),
                                        child: Image.asset("assets/png/home/vehicle_icon.png", height: 2.5.h,)
                                      ),
                                      SizedBox(height: 1.5.h),
                                      customText(
                                        text: "Vehicle",
                                        fontSize: 15.5.sp,
                                        fontWeight: FontWeight.w700,
                                        color: blackColor,
                                        fontFamily: 'inter',
                                      ),
                                      SizedBox(height: 0.5.h),
                                      customText(
                                        text: "Manage fleet",
                                        fontSize: 14.5.sp,
                                        color: Color(0xFF4B5563),
                                        fontFamily: 'inter',
                                      ),
                                    ],
                                  ),
                                ),

                                SizedBox(height: 2.h),
                                InkWell(
                                  onTap: () {
                                    showAddVehicleBottomSheet(context);
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    padding: EdgeInsets.symmetric(vertical: 0.8.h),
                                    decoration: BoxDecoration(
                                      border: Border.all(color: blueColor),
                                      borderRadius: BorderRadius.circular(20.sp),
                                    ),
                                    child: Center(
                                      child: customText(
                                        text: "Add New",
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600,
                                        color: blueColor,
                                        fontFamily: 'inter',
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 4.w),
                          Expanded(
                            child: Column(
                              children: [
                                elevatedContainer(
                                  vPadding: 2.h,
                                  hPadding: 4.w,
                                  containerColor: whiteColor,
                                  child: Column(

                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                          padding: EdgeInsets.all(12.sp),
                                          decoration: BoxDecoration(
                                            color: lightBlueColor.withValues(alpha: 0.7), // light green accent
                                            shape: BoxShape.circle,
                                          ),
                                          child: Image.asset("assets/png/home/equipment_icon.png", height: 2.5.h,)
                                      ),
                                      SizedBox(height: 1.5.h),
                                      customText(
                                        text: "Equipment",
                                        fontSize: 15.5.sp,
                                        fontWeight: FontWeight.w700,
                                        color: blackColor,
                                        fontFamily: 'inter',
                                      ),
                                      SizedBox(height: 0.5.h),
                                      customText(
                                        text: "Manage fleet",
                                        fontSize: 14.5.sp,
                                        color: Color(0xFF4B5563),
                                        fontFamily: 'inter',
                                      ),
                                    ],
                                  ),
                                ),

                                SizedBox(height: 2.h),
                                InkWell(
                                  onTap: () {
                                    showAddEquipmentBottomSheet(context);
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    padding: EdgeInsets.symmetric(vertical: 0.8.h),
                                    decoration: BoxDecoration(
                                      border: Border.all(color: blueColor),
                                      borderRadius: BorderRadius.circular(20.sp),
                                    ),
                                    child: Center(
                                      child: customText(
                                        text: "Add New",
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600,
                                        color: blueColor,
                                        fontFamily: 'inter',
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 4.h),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
