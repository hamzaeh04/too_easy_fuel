import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/color_constants.dart';
import '../../../widgets/button_widget.dart';
import '../../../widgets/customText_widget.dart';
import '../../setting/widgets/elevated_container.dart';
import 'invoice_dialog_widget.dart';

Widget orderDetailWidget(BuildContext context,{String? date, VoidCallback? ontapTrack, VoidCallback? ontapDetails}){
  return Padding(
    padding: EdgeInsets.only(bottom: 1.5.h),
    child: elevatedContainer(
        containerColor: whiteColor,
        vPadding: 1.5.h,
        hPadding: 5.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            customText(
                text: date ?? "Mon, 8 Dec",
                fontSize: 17.sp,
                fontWeight: FontWeight.w700,
                fontFamily: "bl_melody",
                letterSpacing: -0.2
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
                    text: "Completed",
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w400,
                    letterSpacing: -0.2
                ),
              ],
            ),
            SizedBox(height: 1.h,),
            Row(
              children: [
                Expanded(child: buttonWidget("View Details", whiteColor, isGradient: true, onTap: ontapDetails ?? (){
                  invoiceDialog(context);
                })),
                SizedBox(width: 2.5.w,),
                Expanded(child: buttonWidget("Track Order", blueColor, borderColor: blueColor, onTap: ontapTrack ?? (){
                Get.toNamed("trackOrder");
                })),
              ],
            )
          ],
        )
    ),
  );
}