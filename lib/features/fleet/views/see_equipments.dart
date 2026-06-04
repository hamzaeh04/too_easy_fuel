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
    // Access the controller to trigger its lazy initialization when the screen is built
    controller;
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

                  ],),
              ),
            ))
          ],
        ),
      ),
    );
  }

}
