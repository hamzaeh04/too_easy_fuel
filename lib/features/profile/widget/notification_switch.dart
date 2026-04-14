import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:too_easy_fuel/constants/color_constants.dart';
import 'package:too_easy_fuel/widgets/customText_widget.dart';

Widget notificationSwitch({String? title, String? msg, required RxBool isOn}) {
  return Row(
    children: [
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            customText(
              text: title,
              fontWeight: FontWeight.w700,
              fontSize: 16.sp,
              color: blueColor,
              letterSpacing: -0.4,
            ),
            SizedBox(height: 0.25.h,),
            customText(text: msg, fontSize: 14.5.sp, letterSpacing: -0.4, maxLines: 2, overFlow: TextOverflow.visible),
          ],
        ),
      ),
      GestureDetector(
        onTap: () => isOn.value = !isOn.value,
        child: Obx(
          () => AnimatedContainer(
            duration: Duration(milliseconds: 200),
            width: 10.w, // 🔥 wider
            height: 2.5.h, // 🔥 same height
            padding: EdgeInsets.all(3),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: isOn.value ? blueColor : greyColor.withValues(alpha: 0.7),
            ),
            child: AnimatedAlign(
              duration: Duration(milliseconds: 200),
              alignment: isOn.value
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              child: Container(
                width: 18,
                height: 18,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: whiteColor,
                ),
              ),
            ),
          ),
        ),
      ),
    ],
  );
}
