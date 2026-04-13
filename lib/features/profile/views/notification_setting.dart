import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:too_easy_fuel/features/fleet/controller/fleet_controller.dart';
import 'package:too_easy_fuel/features/fleet/widget/fleet_item_widget.dart';
import 'package:too_easy_fuel/features/orders/controller/order_controller.dart';
import 'package:too_easy_fuel/features/orders/widget/order_detail_widget.dart';
import 'package:too_easy_fuel/features/profile/controller/profile_controller.dart';
import 'package:too_easy_fuel/features/profile/widget/notification_switch.dart';
import 'package:too_easy_fuel/features/setting/widgets/elevated_container.dart';
import 'package:too_easy_fuel/features/setting/widgets/menu_widget.dart';
import 'package:too_easy_fuel/widgets/app_bar_widget.dart';
import 'package:too_easy_fuel/widgets/background_widget.dart';
import 'package:too_easy_fuel/widgets/button_widget.dart';
import 'package:too_easy_fuel/widgets/customText_widget.dart';
import 'package:too_easy_fuel/widgets/custom_dialog_widget.dart';
import 'package:too_easy_fuel/widgets/custom_text_feild.dart';

import '../../../constants/color_constants.dart';

class NotificationSettingScreen extends GetView<ProfileController> {
  const NotificationSettingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: radialBackground(
        child: Column(
          children: [
            // appBar("My Account", isBack: false,),
            appBar("Notifications",),
            SizedBox(height: 3.h,),
            /// Toggle Widget
            elevatedContainer(
              hPadding: 4.5.w,
              vPadding: 1.5.h,
              margin: 5.w,
              child: Column(
                children: [
                  notificationSwitch(isOn: controller.isOn, title: "Push Notifications", msg: "Receive notifications on your device"),
                  Divider(color: greyColor.withValues(alpha: 0.6), height: 3.h,),
                  notificationSwitch(isOn: controller.isOn1, title: "Email Notifications", msg: "Get updates via email"),
                  Divider(color: greyColor.withValues(alpha: 0.6), height: 3.h,),
                  notificationSwitch(isOn: controller.isOn2, title: "Project Updates", msg: "Notifications for project changes and assignments"),
                ],
              )
            )
          ],
        ),
      ),
    );
  }

}