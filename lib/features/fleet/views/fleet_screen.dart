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
import '../../home/widget/add_equipment_bottom_sheet.dart';
import '../../home/widget/add_vehicle_bottom_sheet.dart';

class FleetScreen extends GetView<FleetController> {
  const FleetScreen({super.key});
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
    });
    // Access the controller to trigger its lazy initialization when the screen is built
    controller;
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
                        showAddVehicleBottomSheet(context);

                      })),
                    ],
                  ),
                  SizedBox(height: 2.h,),
                  Obx(() {
                    final vehiclesList = controller.vehiclesResponse.value?.data ?? [];
                    if (vehiclesList.isEmpty) {
                      return const Center(child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 2.0),
                        child: Text("No vehicles found"),
                      ));
                    }
                    return ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: vehiclesList.length > 3 ? 3 : vehiclesList.length,
                      itemBuilder: (context, index) {
                        final data = vehiclesList[index];

                        return Padding(
                          padding: EdgeInsets.only(bottom: 1.25.h),
                          child: fleetItem(
                            imgPath: data.vehicleImage,
                            title: "${data.make ?? ''} ${data.model ?? ''}".trim(),
                            subTitle:
                            "${data.make ?? ''} ${data.model ?? ''} (${data.year ?? ''})",
                            detail:
                            "Fuel: ${data.fuelType ?? ''}   Tank: ${data.tankSize ?? ''} gal",
                            port: "Port: ${data.port ?? ''}",
                            controller: controller,
                            vehicalId: data.id,
                            vehical: true,
                          ),
                        );
                      },
                    );
                  }),
                  SizedBox(height: 2.h,),
                  // SizedBox(height: 2.h,),
                  // fleetItem(imgPath: "assets/png/fleet/car1.png", title: "Suzuki Cultus", subTitle: "Suzuki Cultus (2023)", detail: "Fuel: Electric   Tank: 82 gal", port: "Port: left"),
                  // SizedBox(height: 1.25.h,),
                  // fleetItem(imgPath: "assets/png/fleet/car2.png",title: "Honda City", subTitle: "Honda City (2023)", detail: "Fuel: Electric   Tank: 82 gal", port: "Port: left"),
                  // SizedBox(height: 1.25.h,),
                  // fleetItem(imgPath: "assets/png/fleet/car3.png", title: "Toyota Corolla Cross", subTitle: "Toyota Corolla Cross (2023)", detail: "Fuel: Electric   Tank: 82 gal", port: "Port: left"),
                  // SizedBox(height: 2.h,),
                  Row(
                    children: [
                      SizedBox(
                          width: 23.w,
                          child: buttonWidget("See All", blueColor, colors: whiteColor, onTap: (){
                            Get.toNamed("seeEquipments");
                          })),
                      SizedBox(width: 2.w,),
                      Expanded(child: buttonWidget("+ Equipments", whiteColor, isGradient: true,onTap: (){
                        showAddEquipmentBottomSheet(context);
                      }), ),
                    ],
                  ),
                  SizedBox(height: 2.h,),
                  Obx(() {
                    final equipmentList = controller.equipmentResponse.value?.data ?? [];
                    if (equipmentList.isEmpty) {
                      return const Center(child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 2.0),
                        child: Text("No equipment found"),
                      ));
                    }
                    return ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: equipmentList.length > 3 ? 3 : equipmentList.length,
                      itemBuilder: (context, index) {
                        final data = equipmentList[index];

                        return Padding(
                          padding: EdgeInsets.only(bottom: 1.25.h),
                          child: fleetItem(
                            imgPath: data.equipmentImage,
                            title: "${data.equipmentType ?? ''} ${data.model ?? ''}".trim(),
                            subTitle:
                            "${data.equipmentType ?? ''} ${data.model ?? ''} (${data.year ?? ''})",
                            detail:
                            "Fuel: ${data.fuelType ?? ''}   Tank: ${data.tankSize ?? ''} gal",
                            port: "Port: ${data.port ?? ''}",
                              controller: controller,
                            equipmentId: data.id
                          ),
                        );
                      },
                    );
                  }),
                  SizedBox(height: 5.h)
                ],),
              ),
            )),

          ],
        ),
      ),
    );
  }

}
