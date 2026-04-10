import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:too_easy_fuel/features/fleet/controller/fleet_controller.dart';
import 'package:too_easy_fuel/features/fleet/widget/fleet_item_widget.dart';
import 'package:too_easy_fuel/features/orders/controller/order_controller.dart';
import 'package:too_easy_fuel/features/orders/widget/order_detail_widget.dart';
import 'package:too_easy_fuel/features/setting/widgets/elevated_container.dart';
import 'package:too_easy_fuel/widgets/app_bar_widget.dart';
import 'package:too_easy_fuel/widgets/background_widget.dart';
import 'package:too_easy_fuel/widgets/button_widget.dart';
import 'package:too_easy_fuel/widgets/customText_widget.dart';

import '../../../constants/color_constants.dart';

class SeeEquipments extends GetView<FleetController> {
  const SeeEquipments({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: radialBackground(
        child: Column(
          children: [
            appBar("See All",),
            SizedBox(height: 3.h,),
            /// Toggle Widget
            Expanded(child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: Column(
                  children: [
                    fleetItem(imgPath: "assets/png/fleet/equipment1.png", title: "John Deere Tractor", subTitle: "2026 | Gas | 5 Gal", detail: "Port: Right", port: "Last Fueled: 5 hours ago"),
                    SizedBox(height: 1.25.h,),
                    fleetItem(imgPath: "assets/png/fleet/equipment3.png",title: "Honda Push Mower", subTitle: "2026 | Gas | 0.25 Gal", detail: "Port: Right", port: "Last Fueled: 5 hours ago"),
                    SizedBox(height: 1.25.h,),
                    fleetItem(imgPath: "assets/png/fleet/equipment4.png", title: "Jerry Can", subTitle: "Gas | Spare Fuel", detail: "Port: Right", port: "Last Fueled: 5 hours ago"),
                    SizedBox(height: 2.h,),

                  ],),
              ),
            ))
          ],
        ),
      ),
    );
  }

}