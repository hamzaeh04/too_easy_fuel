import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:too_easy_fuel/features/navbar/controller/navbar_controller.dart';
import 'package:too_easy_fuel/constants/color_constants.dart';
import 'package:too_easy_fuel/widgets/customText_widget.dart';

class NavbarScreen extends StatelessWidget {
  final NavbarController controller = Get.put(NavbarController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => controller.pages[controller.selectedIndex.value]),
      bottomNavigationBar: Obx(
        () => Container(
          decoration: BoxDecoration(
            color: whiteColor,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: Offset(0, -2),
              )
            ],
          ),
          child: SafeArea(
            child: Container(
              height: 8.h,
              child: Row(
                children: [
                  _buildNavItem(0, "assets/png/navbar/Home.png", "Home", controller),
                  _buildNavItem(1, "assets/png/navbar/Orders.png", "Orders", controller),
                  _buildNavItem(2, "assets/png/navbar/My Fleet.png", "My Fleet", controller),
                  _buildNavItem(3, "assets/png/navbar/Profile.png", "Profile", controller),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, String iconPath, String label, NavbarController controller) {
    bool isSelected = controller.selectedIndex.value == index;
    return Expanded(
      child: InkWell(
        onTap: () => controller.changeIndex(index),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Exact top edge border
            Container(
              padding: EdgeInsets.symmetric(horizontal: 2.w),
              margin: EdgeInsets.symmetric(horizontal: 3.w),
              height: 0.25.h,
              width: double.infinity,
              color: isSelected ? blueColor : Colors.transparent,
            ),
            Spacer(),
            Image.asset(
              iconPath,
              color: isSelected ? blueColor : greyColor,
              width: 6.5.w,
            ),
            SizedBox(height: 0.5.h),
            customText(
              text: label,
              color: isSelected ? blueColor : greyColor,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              fontSize: 14.5.sp,
              fontFamily: 'inter',
            ),
            Spacer(),
          ],
        ),
      )
    );
  }
}
