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
import '../widget/delivery_detail_widget.dart';
import '../widget/track_order_widget.dart';

class TrackOrderScreen extends GetView<OrderController> {
  const TrackOrderScreen({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: radialBackground(
        child: Column(
          children: [
            appBar("Track Order",),
            SizedBox(height: 3.h,),
            /// Toggle Widget
            Expanded(child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: Column(
                  children: [
                    elevatedContainer(
                      hPadding: 5.w,
                      vPadding: 2.h,
                      child: Column(
                        children: [
                          trackOrderWidget(title: "Order Received", subTitle: "In progress...", imgPath: "assets/png/track_order/recieved.png", step: true,),
                          trackOrderWidget(title: "Fuel on the Way", imgPath: "assets/png/track_order/way.png",),
                          trackOrderWidget(title: "Fueling Up", imgPath: "assets/png/track_order/fueling.png",),
                          trackOrderWidget(title: "Completed", imgPath: "assets/png/track_order/check.png", isLast: true),
                        ],
                      )
                    ),
                    SizedBox(height: 1.8.h,),
                    elevatedContainer(
                        containerColor: whiteColor,
                        vPadding: 2.h,
                        hPadding: 5.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 0.5.h,),

                            customText(
                                text: "Delivery Details",
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w700,
                                fontFamily: "bl_melody",
                                letterSpacing: -0.2
                            ),
                            Divider(),
                            deliveryDetailWidget(imgPath: "assets/png/calendar.png", title: "Date", subTitle: "Sunday, March 15, 2026"),
                            Divider(),
                            deliveryDetailWidget(imgPath: "assets/png/clock.png", title: "Time Window", subTitle: "2:00 PM - 2:30 PM"),
                            Divider(),
                            deliveryDetailWidget(imgPath: "assets/png/track_order/location.png", title: "Delivery Address", subTitle: "123 Main St, San Francisco, CA 94102"),
                            Divider(),
                            deliveryDetailWidget(imgPath: "assets/png/track_order/fuel.png", title: "Fuel Type", subTitle: "Regular"),
                          ],
                        )
                    ),
                    SizedBox(height: 5.h,)

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