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

class FleetScreen extends GetView<FleetController> {
  const FleetScreen({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: radialBackground(
        child: Column(
          children: [
            appBar("My Fleet", isBack: false),
            SizedBox(height: 3.h,),
            /// Toggle Widget
            Expanded(child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 23.w,
                          child: buttonWidget("See All", blueColor, colors: whiteColor, onTap: (){
                            Get.toNamed("seeVehicle");
                          })),
                      SizedBox(width: 2.w,),
                      Expanded(child: buttonWidget("+ Add Vehicle", whiteColor, isGradient: true, onTap: (){
                        Get.toNamed("profile");
                      })),
                    ],
                  ),
                  SizedBox(height: 2.h,),
                  fleetItem(imgPath: "assets/png/fleet/car1.png", title: "Suzuki Cultus", subTitle: "Suzuki Cultus (2023)", detail: "Fuel: Electric   Tank: 82 gal", port: "Port: left"),
                  SizedBox(height: 1.25.h,),
                  fleetItem(imgPath: "assets/png/fleet/car2.png",title: "Honda City", subTitle: "Honda City (2023)", detail: "Fuel: Electric   Tank: 82 gal", port: "Port: left"),
                  SizedBox(height: 1.25.h,),
                  fleetItem(imgPath: "assets/png/fleet/car3.png", title: "Toyota Corolla Cross", subTitle: "Toyota Corolla Cross (2023)", detail: "Fuel: Electric   Tank: 82 gal", port: "Port: left"),
                  SizedBox(height: 2.h,),
                  Row(
                    children: [
                      SizedBox(
                          width: 23.w,
                          child: buttonWidget("See All", blueColor, colors: whiteColor, onTap: (){
                            Get.toNamed("seeEquipments");
                          })),
                      SizedBox(width: 2.w,),
                      Expanded(child: buttonWidget("+ Equipments", whiteColor, isGradient: true)),
                    ],
                  ),
                  SizedBox(height: 2.h,),
                  fleetItem(imgPath: "assets/png/fleet/equipment1.png", title: "John Deere Tractor", subTitle: "Tesla Model 3 (2023)", detail: "Fuel: Electric   Tank: 82 gal", port: "Port: left"),
                  SizedBox(height: 1.25.h,),
                  fleetItem(imgPath: "assets/png/fleet/equipment2.png",title: "Honda Push Mower", subTitle: "Tesla Model 3 (2023)", detail: "Fuel: Electric   Tank: 82 gal", port: "Port: left"),
                ],),
              ),
            ))
          ],
        ),
      ),
    );
  }

}