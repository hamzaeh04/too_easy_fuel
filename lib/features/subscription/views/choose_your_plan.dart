import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:too_easy_fuel/widgets/background_widget.dart';
import 'package:too_easy_fuel/widgets/plan_card.dart';
import 'package:too_easy_fuel/widgets/simple_app_bar.dart';

import '../../../widgets/customText_widget.dart';

class ChooseYourPlan extends StatelessWidget {
  const ChooseYourPlan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: radialBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [
              simpleAppBar("Choose Your Plan",isBack: true),
          SizedBox(height: 2.h),
          customText(
            text:
            "Lorem ipsum dolor sit amet, consectetur\nadipiscing elit, sed do eiusmod tempor incididunt\nut labore et dolore.",
            fontSize: 15.sp,
            textAlign: TextAlign.center,
          ),
              SizedBox(height: 2.h),
              planWidget("Monthly",19.99,"1 delivery/month","/month",onTap: (){
Get.toNamed("SubscriptionPayment");
              }),

              SizedBox(height: 2.h),
              planWidget("Monthly",19.99,"1 delivery/month","/month",onTap: (){
                Get.toNamed("SubscriptionPayment");
              }),
              SizedBox(height: 2.h),
              planWidget("Monthly",19.99,"1 delivery/month","/month",onTap: (){
                Get.toNamed("SubscriptionPayment");
              }),
              SizedBox(height: 8.h),
            ],
          ),
        ),
      ),
      
    );
  }
}
