import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:too_easy_fuel/constants/color_constants.dart';
import 'package:too_easy_fuel/widgets/button_widget.dart';
import 'package:too_easy_fuel/widgets/customText_widget.dart';

import '../../orders/widget/invoice_dialog_widget.dart';

void fuel_3_bottomsheet(BuildContext context) {
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

                        // Detail heading
                        customText(
                          text: "Vehicle or Equipment Detail",
                          fontSize: 18.5.sp,
                          color: blueColor,
                          fontWeight: FontWeight.bold,
                          fontFamily: "bl_melody",
                        ),
                        SizedBox(height: 2.h),

                        // Grid 2x2
                        Row(
                          children: [
                            Expanded(child: _buildDetailCard("Make", "Toyota RAV4")),
                            SizedBox(width: 3.w),
                            Expanded(child: _buildDetailCard("Model", "2019")),
                          ],
                        ),
                        SizedBox(height: 1.5.h),
                        Row(
                          children: [
                            Expanded(child: _buildDetailCard("Fuel Type", "Gas")),
                            SizedBox(width: 3.w),
                            Expanded(child: _buildDetailCard("Tank Size", "14.5 Gal")),
                          ],
                        ),
                        SizedBox(height: 1.5.h),

                        // Single full width card
                        _buildDetailCard("Port Side", "Left", fullWidth: true),
                        SizedBox(height: 3.h),

                        // Payment Detail Block
                        Container(
                          padding: EdgeInsets.all(4.w),
                          decoration: BoxDecoration(
                            color: whiteColor,
                            borderRadius: BorderRadius.circular(15.sp),
                            border: Border.all(color: greyColor.withValues(alpha: 0.2)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.08),
                                blurRadius: 10,
                                offset: Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              customText(
                                text: "Payment Detail",
                                fontSize: 16.5.sp,
                                fontWeight: FontWeight.bold,
                                color: blackColor,
                                fontFamily: "inter",
                              ),
                              SizedBox(height: 0.25.h),

                              Divider(),
                              SizedBox(height: 0.25.h),
                              _buildPaymentRow("Fuel Price Per Gallon", "\$ 10.00"),
                              _buildPaymentRow("Order Quantity", "10.5 Gal"),
                              _buildPaymentRow("Tax", "\$ 2.00"),
                              _buildPaymentRow("Total Fuel Amount", "\$ 150.00"),
                              _buildPaymentRow("Discount Amount", "\$ 10.00"),
                              _buildPaymentRow("Service Charges 15%", "\$ 2.00"),
                              _buildPaymentRow("Total", "\$ 154.00", isLast: true),
                            ],
                          ),
                        ),
                        SizedBox(height: 3.h),
                        buttonWidget("Pay Now", whiteColor, isGradient: true, onTap: (){
                          invoiceDialog(context, isButton: false);
                        }),
                        SizedBox(height: 1.h),
                        buttonWidget("Cancel", blueColor, borderColor: blueColor, onTap: (){
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

Widget _buildDetailCard(String title, String subtitle, {bool fullWidth = false}) {
  return Container(
    width: fullWidth ? double.infinity : null,
    padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.5.h),
    decoration: BoxDecoration(
      color: whiteColor,
      borderRadius: BorderRadius.circular(13.sp),
      border: Border.all(color: greyColor.withValues(alpha: 0.25)),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.08),
          blurRadius: 10,
          offset: Offset(0, 4),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        customText(
          text: title,
          fontSize: 15.5.sp,
          color: blueColor,
          fontWeight: FontWeight.bold,
          fontFamily: "bl_melody",
        ),
        SizedBox(height: 0.5.h),
        customText(
          text: subtitle,
          fontSize: 14.5.sp,
          color: blackColor,
          fontFamily: "inter",
        ),
      ],
    ),
  );
}

Widget _buildPaymentRow(String label, String value, {bool isLast = false}) {
  return Column(
    children: [
      Padding(
        padding: EdgeInsets.symmetric(vertical: 0.8.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            customText(
              text: label,
              fontSize: 15.sp,
              color: blackColor,
              fontFamily: "inter",
            ),
            customText(
              text: value,
              fontSize: 15.sp,
              color: blackColor,
              fontFamily: "inter",
            ),
          ],
        ),
      ),
      if (isLast == false) Divider(color: greyColor.withValues(alpha: 0.2)),
    ],
  );
}
