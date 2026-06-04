import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:too_easy_fuel/core/services/base_services.dart';
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
import 'package:too_easy_fuel/widgets/custom_dialog_widget.dart';
import 'package:too_easy_fuel/widgets/custom_text_feild.dart';

import '../../../constants/color_constants.dart';

class EditProfileScreen extends GetView<ProfileController> {
  const EditProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    // Trigger initialization if not already done
    controller;
    return Scaffold(
      body: radialBackground(
          child: Column(
            children: [
              appBar("Edit Profile",),
              SizedBox(height: 3.h,),
              Expanded(child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          controller.pickProfileImage();
                        },
                        child: Stack(
                          children: [
                            Obx(() {
                              final localImage = controller.profileImage.value;
                              final networkImage = controller.networkProfileImage.value;

                              ImageProvider imageProvider;
                              if (localImage != null) {
                                imageProvider = FileImage(localImage);
                              } else if (networkImage.isNotEmpty) {
                                final fullUrl = networkImage.startsWith("http")
                                    ? networkImage
                                    : "${BaseService().baseURL}$networkImage";
                                imageProvider = NetworkImage(fullUrl);
                              } else {
                                imageProvider = const AssetImage("assets/png/home/profile.png");
                              }

                              return Container(
                                height: 15.h,
                                width: 30.w,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.grey[200],
                                  image: DecorationImage(
                                    image: imageProvider,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            }),

                            Positioned(
                              bottom: 5,
                              right: 5,
                              child: Container(
                                padding: const EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                  color: blueColor,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 2,
                                  ),
                                ),
                                child: const Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                  size: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 2.h),
                      customTextField("Full Name", "John Smith", path: "assets/png/auth_image/field-icons-user.png", isObscure: controller.isObscure, controller: controller.fullNameController),
                      SizedBox(height: 1.25.h,),
                      customTextField("Email", "john.smith@example.com", path: "assets/png/auth_image/field-icons-email.png", isObscure: controller.isObscure, controller: controller.emailController),
                      SizedBox(height: 1.25.h,),
                      customTextField("Phone Number", "(555) 123-4567", path: "assets/png/track_order/phone.png", isObscure: controller.isObscure, controller: controller.phoneNoController),
                      SizedBox(height: 1.25.h,),
                      customTextField("Default Address", "Enter your default address", path: "assets/png/track_order/location.png", isObscure: controller.isObscure, controller: controller.addressController),
                      SizedBox(height: 3.5.h,),
                      buttonWidget("Save Changes", whiteColor, isGradient: true, onTap: () {
                        controller.updateProfile(context);
                      })
                    ],
                  ),
                ),
              ))
            ],
          ),
      ),
    );
  }

}
