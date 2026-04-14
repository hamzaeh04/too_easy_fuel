import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:too_easy_fuel/features/fleet/controller/fleet_controller.dart';
import 'package:too_easy_fuel/features/fleet/widget/fleet_item_widget.dart';
import 'package:too_easy_fuel/features/orders/controller/order_controller.dart';
import 'package:too_easy_fuel/features/orders/widget/order_detail_widget.dart';
import 'package:too_easy_fuel/features/profile/controller/profile_controller.dart';
import 'package:too_easy_fuel/features/setting/widgets/elevated_container.dart';
import 'package:too_easy_fuel/features/setting/widgets/menu_widget.dart';
import 'package:too_easy_fuel/widgets/app_bar_widget.dart';
import 'package:too_easy_fuel/widgets/background_widget.dart';
import 'package:too_easy_fuel/widgets/button_widget.dart';
import 'package:too_easy_fuel/widgets/customText_widget.dart';

import '../../../constants/color_constants.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: radialBackground(
        child: Stack(
          children: [
            Column(
              children: [
                // appBar("My Account", isBack: false,),
                appBar("My Account", isBack: false, height: 21.h, padding: 6.5.h),
                SizedBox(height: 3.h,),
                /// Toggle Widget
                Expanded(child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: Column(
                      children: [
                        SizedBox(height: 6.h,),
                        elevatedContainer(
                          hPadding: 5.w,
                          vPadding: 2.h,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              customText(
                                text: "John Smith",
                                fontSize: 19.sp,
                                color: blueColor,
                                fontFamily: "bl_melody",
                                fontWeight: FontWeight.bold
                              ),
                              SizedBox(height: 0.5.h,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset("assets/png/auth_image/field-icons-email.png", height: 2.25.h,),
                                  SizedBox(width: 3.w,),
                                  customText(text: "john.smith@example.com", fontSize: 15.sp,
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 1.75.h,),
                        menu("Edit Profile", color: lightBlueColor, imagePath: "assets/png/faqs.png", vMargin: 0.5.h, ontap: () => Get.toNamed("editprofile")),
                        menu("Subscription", color: lightYellowColor, imagePath: "assets/png/support.png", vMargin: 0.5.h, ontap: () => Get.toNamed("SubscriptionPlan")),
                        menu("Payment Method", color: lightGreenColor, imagePath: "assets/png/about.png", vMargin: 0.5.h),
                        menu("Change Password", color: lightPurpleColor, imagePath: "assets/png/track_order/changePass.png", vMargin: 0.5.h, ontap: ()=> Get.toNamed("changePassword")),
                        menu("Notification Settings", color: lightOrangeColor, imagePath: "assets/png/track_order/notification.png", vMargin: 0.5.h, ontap: ()=> Get.toNamed("notificationSetting")),
                        menu("Help & Support", color: lightPinkColor, imagePath: "assets/png/track_order/help.png", vMargin: 0.5.h),

                        SizedBox(height: 3.h,),
                        
                        buttonWidget("Logout", redAppBarColor, colors: redAppBarColor.withValues(alpha: 0.12), onTap: (){
                          Get.offAllNamed("login");
                        }),
                        SizedBox(height: 5.h,),

                      ],),
                  ),
                ))
              ],
            ),
            Positioned(
                top: 13.25.h,
                left: 0,
                right: 0,
                child: Container(
              height: 14.5.h,
              width: 30.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: blueColor,
                border: Border.all(color: whiteColor, width: 0.05.w)
              ),
                  child: Image.asset("assets/png/profile.png",),
            ))
          ],
        )
      ),
    );
  }

}