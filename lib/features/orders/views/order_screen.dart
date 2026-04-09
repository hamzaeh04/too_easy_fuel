import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:too_easy_fuel/features/orders/controller/order_controller.dart';
import 'package:too_easy_fuel/features/orders/widget/order_detail_widget.dart';
import 'package:too_easy_fuel/features/setting/widgets/elevated_container.dart';
import 'package:too_easy_fuel/widgets/app_bar_widget.dart';
import 'package:too_easy_fuel/widgets/background_widget.dart';
import 'package:too_easy_fuel/widgets/button_widget.dart';
import 'package:too_easy_fuel/widgets/customText_widget.dart';

import '../../../constants/color_constants.dart';

class OrderScreen extends GetView<OrderController> {
  const OrderScreen({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: radialBackground(
        child: Column(
          children: [
            appBar("Orders", isBack: false),
            SizedBox(height: 3.h,),
            /// Toggle Widget
            Expanded(child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 6.h,
                            decoration: BoxDecoration(
                              color: notificationGreyColor,
                              borderRadius: BorderRadius.circular(8.w),
                              boxShadow: [
                                BoxShadow(
                                  color: blackColor.withOpacity(0.08), // soft shadow
                                  blurRadius: 10,
                                  offset: Offset(0, 4), // slight lift
                                ),
                              ],
                              border: Border.all(
                                color: greyColor.withValues(alpha: 0.3), // subtle edge
                              ),
                            ),
                            child: Obx(() {
                              return Padding(
                                padding: EdgeInsets.symmetric(horizontal: 1.5.w, vertical: 0.5.h),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: InkWell(
                                        onTap: () {
                                          controller.isSelected.value = !controller.isSelected.value;
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: controller.isSelected.value
                                                  ? whiteColor
                                                  : notificationGreyColor,
                                              borderRadius: BorderRadius.circular(8.w),
                                              border: Border.all(color: controller.isSelected.value
                                                  ? greyColor.withValues(alpha: 0.25)
                                                  : notificationGreyColor)
                                          ),
                                          child: Center(
                                            child: customText(
                                              text: "Upcoming Orders",
                                              fontSize: 14.5.sp,
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 0), // remove spacing between buttons if needed
                                    Expanded(
                                      child: InkWell(
                                        onTap: () {
                                          controller.isSelected.value = !controller.isSelected.value;
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: controller.isSelected.value
                                                  ? notificationGreyColor
                                                  : whiteColor,
                                              borderRadius: BorderRadius.circular(8.w),
                                              border: Border.all(color: controller.isSelected.value
                                                  ? notificationGreyColor
                                                  : greyColor.withValues(alpha: 0.25),)
                                          ),
                                          child: Center(
                                            child: customText(
                                              text: "History",
                                              fontSize: 14.5.sp,
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }),
                          ),
                        ),
                        SizedBox(width: 2.w,),
                        InkWell(
                          onTap: (){
                            Get.toNamed("fleet");
                          },
                          child: Container(
                            height: 6.h,
                            width: 12.8.w,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: transparentColor,
                                border: Border.all(color: blueColor, )
                            ),
                            child: Icon(Icons.add, color: blackColor, size: 21.sp,),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 2.h,),
                    Obx((){
                      if(controller.isSelected.value == true){
                        return Column(
                          children: [
                            orderDetailWidget(context, date: "Mon, 8 Dec"),
                            orderDetailWidget(context, date: "Mon, 10 Dec",),
                          ],
                        );
                      } else{
                        return Column(
                          children: [
                            orderDetailWidget(context, date: "Mon, 8 Dec"),
                          ],
                        );
                      }
                    })
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
  
}