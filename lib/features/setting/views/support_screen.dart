import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:too_easy_fuel/constants/color_constants.dart';
import 'package:too_easy_fuel/widgets/customText_widget.dart';
import 'package:too_easy_fuel/features/setting/controller/setting_controller.dart';
import 'package:too_easy_fuel/features/setting/widgets/elevated_container.dart';
import 'package:too_easy_fuel/features/setting/widgets/textfield.dart';
import 'package:too_easy_fuel/widgets/app_bar_widget.dart';
import 'package:too_easy_fuel/widgets/background_widget.dart';

import '../../../widgets/button_widget.dart';

class SupportScreen extends GetView<SettingController> {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: radialBackground(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            appBar("Help & Support"),
            SizedBox(height: 3.h,),
            Expanded(
                child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    customText(
                        text: "How can we help you?",
                        fontSize: 19.5.sp,
                        fontWeight: FontWeight.w900,
                        color: blueAppBarColor,
                        fontFamily: "bl_melody",
                        letterSpacing: -0.5
                    ),
                    SizedBox(height: 1.5.h,),
                    customText(
                      text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed neque eros, sollicitudin ac eros non,",
                    ),
                    SizedBox(height: 3.h,),
                    Row(
                      children: [
                        customText(
                          text: "Subject",
                          fontSize: 14.5.sp
                        ),customText(
                          text: "*",
                          color: redColor,
                          fontSize: 16.sp
                        ),
                      ],
                    ),
                    SizedBox(height: 1.h,),
                    elevatedContainer(
                      height: 6.h,
                      radius: 8.w,
                      child: textfield()
                    ),
                    SizedBox(height: 1.h,),
                    Row(
                      children: [
                        customText(
                            text: "Message",
                            fontSize: 14.5.sp
                        ),customText(
                            text: "*",
                            color: redColor,
                            fontSize: 16.sp
                        ),
                      ],
                    ),
                    SizedBox(height: 1.h,),
                    elevatedContainer(
                        height: 20.h,
                      child: textfield(maxLines: 6)
                    ),
                    SizedBox(height: 3.h,),
                    buttonWidget(
                        "Submit",
                        whiteColor,
                        isGradient: true,
                        colors: whiteColor,
                        fontsize: 15.5.sp,
                        fontweight: FontWeight.w600,
                        onTap: (){
                        }
                    ),
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
