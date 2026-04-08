import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

Widget slideWidget(RxInt selectedIndex) {
  return Obx(() =>
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        3, // number of indicators
            (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: EdgeInsets.symmetric(horizontal: 0.7.w),
          width: index == selectedIndex.value ? 10.w : 2.5.w, // width changes if selected
          height: 2.5.w,
          decoration: BoxDecoration(
            color: index == selectedIndex.value ? Colors.yellow : Colors.grey,
            borderRadius: BorderRadius.circular(2.w), // rounded
          ),
        ),
      ),
    ),
  );
}
