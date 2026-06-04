import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:too_easy_fuel/features/fleet/controller/fleet_controller.dart';
import 'package:too_easy_fuel/widgets/customText_widget.dart';

import '../../../constants/color_constants.dart';
import '../../setting/widgets/elevated_container.dart';

Widget fleetItem({
  String? imgPath,
  String? title,
  String? subTitle,
  String? detail,
  String? port,
  bool? vehical,
  String? vehicalId,
  String? equipmentId,
  FleetController? controller
}) {
  return elevatedContainer(
    vPadding: 2.h,
    hPadding: 5.w,
    containerColor: whiteColor,
    radius: 18.sp,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 7.h,
          width: 15.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18.sp),
          ),
          child: Image.network(
            "http://app.yourwebsitemockup.net/tooEasyFuel-backend${imgPath ?? ''}",
            fit: BoxFit.cover,
          )
        ),

        SizedBox(width: 4.w),

        /// ✅ IMPORTANT: constrain text width
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customText(
                text: title ?? "",
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                fontFamily: "bl_melody",
                letterSpacing: -0.4,
                color: blueColor,
                maxLines: 1,
                overFlow: TextOverflow.ellipsis,
                height: 1,
              ),

              customText(
                text: subTitle ?? "Suzuki Cultus (2023)",
                fontSize: 15.5.sp,
                fontWeight: FontWeight.w400,
                letterSpacing: -0.4,
                color: blackColor,
                maxLines: 1,
                overFlow: TextOverflow.ellipsis,
              ),

              customText(
                text: detail ?? "Fuel: Electric    Tank: 82 gal",
                fontSize: 15.sp,
                fontWeight: FontWeight.w400,
                letterSpacing: -0.4,
                color: darkGreyColor,
                maxLines: 1,
                overFlow: TextOverflow.ellipsis,
              ),

              customText(
                text: port ?? "Port: left",
                fontSize: 15.sp,
                fontWeight: FontWeight.w400,
                letterSpacing: -0.4,
                color: darkGreyColor,
                maxLines: 1,
                overFlow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),

        PopupMenuButton<String>(
          icon: Icon(
            Icons.more_vert_sharp,
            size: 21.5.sp,
          ),
          color: Colors.white, // background color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          onSelected: (value) {
            if (value == 'edit') {
              // TODO: edit action
              print("Edit tapped");
            } else if (value == 'delete') {
              // TODO: delete action
               if (vehical == true || (vehicalId != null && vehicalId.isNotEmpty)) {
                 controller?.deleteVehical(vehicalId ?? '').then((success) {
                   if (success == true) {
                     controller?.getVehicles();
                   }
                 });
               } else {
                 controller?.deleteEquipment(equipmentId ?? '').then((success) {
                   if (success == true) {
                     controller?.getEquipment();
                   }
                 });
               }
              print("Delete tapped");
            }
          },
          itemBuilder: (context) => [
            PopupMenuItem(
              value: 'edit',
              child: Row(
                children: [
                  Icon(Icons.edit, color: Colors.black, size: 18),
                  SizedBox(width: 2.w),
                  customText(text: "Edit")
                ],
              ),
            ),
            PopupMenuItem(
              value: 'delete',
              child: Row(
                children: [
                  Icon(Icons.delete, color: Colors.red, size: 18),
                  SizedBox(width: 2.w),
                  customText(text: "Delete",color: redColor)
                ],
              ),
            ),
          ],
        )
      ],
    ),
  );
}
