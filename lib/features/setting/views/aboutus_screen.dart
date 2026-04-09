import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:too_easy_fuel/constants/constants_widgets.dart';
import 'package:too_easy_fuel/features/setting/controller/setting_controller.dart';
import 'package:too_easy_fuel/features/setting/widgets/elevated_container.dart';
import 'package:too_easy_fuel/widgets/background_widget.dart';

import '../../../constants/color_constants.dart';
import '../../../widgets/app_bar_widget.dart';

class AboutUsScreen extends GetView<SettingController> {
  const AboutUsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: radialBackground(
        child: Column(
          children: [
            appBar("About Us"),

            /// 🔥 THIS IS THE FIX
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 3.h),

                    elevatedContainer(
                      margin: 5.w,
                      height: 24.h,
                      vPadding: 1.8.h,
                      child: Image.asset("assets/png/too_easy_fuel_logo.png"),
                    ),

                    SizedBox(height: 1.25.h),

                    elevatedContainer(
                      margin: 5.w,
                      vPadding: 1.8.h,
                      child: customText(
                        text:
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed neque eros, sollicitudin ac eros non, auctor gravida risus. Nam iaculis tincidunt turpis, in ultrices justo mattis vel. Praesent tincidunt commodo faucibus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent ac odio orci. Proin ut lobortis neque, non scelerisque lorem. Nunc nunc dui, pretium nec sem vitae, tempor viverra odio. Morbi ut molestie felis. In in sapien tortor. Nam porta et augue vel molestie. Duis hendrerit ac arcu ac vestibulum. Donec congue venenatis lectus, vitae commodo justo dictum et.  Morbi eget ultricies orci, quis ultricies enim. Maecenas varius ut ex vel fringilla. Suspendisse eu odio ullamcorper, feugiat nisi pharetra, congue enim. Curabitur vitae nisl eget diam tempor ultricies id et justo. Etiam vitae ante placerat, fermentum risus a, feugiat tortor. Proin ac lorem tellus. Praesent cursus nibh at condimentum semper. Curabitur neque leo, tristique at leo ut, sollicitudin egestas magna.",
                      ),
                    ),

                    SizedBox(height: 3.h), // bottom spacing
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );  }
}
