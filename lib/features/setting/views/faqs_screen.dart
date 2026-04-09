import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:too_easy_fuel/features/setting/controller/setting_controller.dart';
import 'package:too_easy_fuel/widgets/app_bar_widget.dart';
import 'package:too_easy_fuel/widgets/background_widget.dart';

import '../widgets/menu_widget.dart';

class FaqsScreen extends GetView<SettingController> {
  const FaqsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: radialBackground(
        child: Column(
          children: [
            appBar("FAQs"),
            SizedBox(height: 3.h,),
            menu("How do I schedule a fuel delivery?", isIcon: true, icon: Icons.description_outlined,  color: Colors.transparent, fontSize: 15.sp),
            SizedBox(height: 1.1.h,),
            menu("What are your delivery hours?", isIcon: true, icon: Icons.description_outlined,  color: Colors.transparent, fontSize: 15.sp),
            SizedBox(height: 1.1.h,),
            menu("How do I change my subscription plan?", isIcon: true, icon: Icons.description_outlined,  color: Colors.transparent, fontSize: 15.sp),
            SizedBox(height: 1.1.h,),
            menu("What payment methods do you accept?", isIcon: true, icon: Icons.description_outlined,  color: Colors.transparent, fontSize: 15.sp),
            SizedBox(height: 1.1.h,),
            menu("How do I add a new vehicle?", isIcon: true, icon: Icons.description_outlined,  color: Colors.transparent, fontSize: 15.sp),
            SizedBox(height: 1.1.h,),
            menu("What if I need to cancel my delivery?", isIcon: true, icon: Icons.description_outlined,  color: Colors.transparent, fontSize: 15.sp),

          ],
        ),
      ),
    );
  }

}