import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:too_easy_fuel/constants/color_constants.dart';
import 'package:too_easy_fuel/features/subscription/widgets/active_subscription.dart';
import 'package:too_easy_fuel/widgets/app_bar_widget.dart';
import 'package:too_easy_fuel/widgets/background_widget.dart';

import '../../../widgets/customText_widget.dart';
import '../../../widgets/plan_card.dart';

class SubscriptionPlan extends StatelessWidget {
  const SubscriptionPlan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: radialBackground(
        child: Column(
          children: [
            appBar("Subscription"),
            Expanded(child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 2.h),
                  activeSubscription(margin: 5.w),
                  SizedBox(height: 1.5.h),
                  Row(
                    children: [
                      SizedBox(width: 5.w,),
                      customText(
                        text: "Choose New Plan",
                        color: blueColor,
                        fontFamily: "bl_melody",
                        fontSize: 19.sp,
                        fontWeight: FontWeight.w700,
                        height: 0.13.h,
                      ),
                    ],
                  ),
                  SizedBox(height: 1.5.h),

                  planWidget("Basic",19.99,"Pay per delivery","/month", isPlan: true, onTap: (){
                    Get.toNamed("SubscriptionPayment");
                  },
                  child: Column(
                    children: [
                      planWidgetRow("\$5.99 delivery fee per order"),
                      planWidgetRow("Schedule 30-min windows"),
                      planWidgetRow("Standard support"),
                    ],
                  )),
                  SizedBox(height: 1.5.h),
                  planWidget("Bi-Weekly",19.99,"2 delivery/month","/month", isActive: true, onTap: (){
                    Get.toNamed("SubscriptionPayment");
                  },
                      child: Column(
                        children: [
                          planWidgetRow("Free delivery"),
                          planWidgetRow("Priority scheduling"),
                          planWidgetRow("Cancel anytime"),
                          planWidgetRow("24/7 support"),
                        ],
                      )),
                  SizedBox(height: 1.5.h),
                  planWidget("Monthly",19.99,"1 delivery/month","/month", onTap: (){
                    Get.toNamed("SubscriptionPayment");
                  },
                      child: Column(
                        children: [
                          planWidgetRow("Free delivery"),
                          planWidgetRow("Set scheduling"),
                          planWidgetRow("Cancel anytime"),
                          planWidgetRow("Email support"),
                        ],
                      )),
                  SizedBox(height: 8.h),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
