import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:too_easy_fuel/constants/color_constants.dart';

import '../../../widgets/customText_widget.dart';

Future<void> invoiceDialog(BuildContext context, {String? order}) {
  return showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        backgroundColor: whiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.sp),
        ),
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
              child: Column(
                mainAxisSize: MainAxisSize.min, // 👈 IMPORTANT
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  customText(
                      text: "Invoice",
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                      fontFamily: "bl_melody",
                      letterSpacing: -0.2,
                      color: blueColor,
                    height: 1
                  ),
                  Divider(),
                  SizedBox(height: 1.h,),
                  customText(
                      text: "Order Detail",
                      fontSize: 17.5.sp,
                      fontWeight: FontWeight.w700,
                      fontFamily: "bl_melody",
                      letterSpacing: -0.2,
                      color: blackColor,
                      height: 1.2
                  ),
                  Divider(),
                  SizedBox(height: 0.5.h,),
                  Row(
                    children: [
                      customText(
                          text: "Order #",
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w400,
                          letterSpacing: -0.2
                      ),
                      Spacer(),
                      customText(
                          text: "12345",
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w400,
                          letterSpacing: -0.2
                      ),
                    ],
                  ),
                  Divider(),
                  SizedBox(height: 0.5.h,),
                  Row(
                    children: [
                      customText(
                          text: "Quantity:",
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w400,
                          letterSpacing: -0.2
                      ),
                      Spacer(),
                      customText(
                          text: "10.5 Gallons",
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w400,
                          letterSpacing: -0.2
                      ),
                    ],
                  ),
                  Divider(),
                  SizedBox(height: 0.5.h,),
                  Row(
                    children: [
                      customText(
                          text: "Date:",
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w400,
                          letterSpacing: -0.2
                      ),
                      Spacer(),
                      customText(
                          text: "21 Dec 2026",
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w400,
                          letterSpacing: -0.2
                      ),
                    ],
                  ),
                  Divider(),
                  SizedBox(height: 0.5.h,),
                  Row(
                    children: [
                      customText(
                          text: "Toyota:",
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w400,
                          letterSpacing: -0.2
                      ),
                      Spacer(),
                      customText(
                          text: "RAV4",
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w400,
                          letterSpacing: -0.2
                      ),
                    ],
                  ),
                  Divider(),
                  SizedBox(height: 0.5.h,),
                  Row(
                    children: [
                      customText(
                          text: "Status:",
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w400,
                          letterSpacing: -0.2
                      ),
                      Spacer(),
                      customText(
                          text: "Order Received",
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w400,
                          letterSpacing: -0.2
                      ),
                    ],
                  ),
                  Divider(),
                  SizedBox(height: 1.h,),
                  customText(
                      text: "Payment Detail",
                      fontSize: 17.5.sp,
                      fontWeight: FontWeight.w700,
                      fontFamily: "bl_melody",
                      letterSpacing: -0.2,
                      color: blackColor,
                      height: 1.2
                  ),
                  Divider(),
                  SizedBox(height: 0.5.h,),
                  Row(
                    children: [
                      customText(
                          text: "Fuel Price Per Gallon",
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w400,
                          letterSpacing: -0.2
                      ),
                      Spacer(),
                      customText(
                          text: "\$10.00",
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w400,
                          letterSpacing: -0.2
                      ),
                    ],
                  ),
                  Divider(),
                  SizedBox(height: 0.5.h,),
                  Row(
                    children: [
                      customText(
                          text: "Order Quantity:",
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w400,
                          letterSpacing: -0.2
                      ),
                      Spacer(),
                      customText(
                          text: "10.5 Gallons",
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w400,
                          letterSpacing: -0.2
                      ),
                    ],
                  ),
                  Divider(),
                  SizedBox(height: 0.5.h,),
                  Row(
                    children: [
                      customText(
                          text: "Tax:",
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w400,
                          letterSpacing: -0.2
                      ),
                      Spacer(),
                      customText(
                          text: "\$2.00",
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w400,
                          letterSpacing: -0.2
                      ),
                    ],
                  ),
                  Divider(),
                  SizedBox(height: 0.5.h,),
                  Row(
                    children: [
                      customText(
                          text: "Total Fuel Amount:",
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w400,
                          letterSpacing: -0.2
                      ),
                      Spacer(),
                      customText(
                          text: "\$150.00",
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w400,
                          letterSpacing: -0.2
                      ),
                    ],
                  ),
                  Divider(),
                  SizedBox(height: 0.5.h,),
                  Row(
                    children: [
                      customText(
                          text: "Discount Amount:",
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w400,
                          letterSpacing: -0.2
                      ),
                      Spacer(),
                      customText(
                          text: "\$10.00",
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w400,
                          letterSpacing: -0.2
                      ),
                    ],
                  ),
                  Divider(),
                  SizedBox(height: 0.5.h,),
                  Row(
                    children: [
                      customText(
                          text: "Service Charges 15%:",
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w400,
                          letterSpacing: -0.2
                      ),
                      Spacer(),
                      customText(
                          text: "\$2.00",
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w400,
                          letterSpacing: -0.2
                      ),
                    ],
                  ),
                  Divider(),
                  SizedBox(height: 0.5.h,),
                  Row(
                    children: [
                      customText(
                          text: "Total:",
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w400,
                          letterSpacing: -0.2
                      ),
                      Spacer(),
                      customText(
                          text: "\$154.00",
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w400,
                          letterSpacing: -0.2
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
                top: 1.h,
                right: 2.5.w,
                child: InkWell(
                  onTap: (){
                    Get.back();
                  },
                    child: Icon(Icons.cancel_outlined, size: 21.sp,)))
          ],
        )
      );
    },
  );
}
