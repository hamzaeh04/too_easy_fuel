import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:too_easy_fuel/constants/constants_widgets.dart';
import 'package:too_easy_fuel/features/setting/controller/setting_controller.dart';
import 'package:too_easy_fuel/features/setting/widgets/elevated_container.dart';
import 'package:too_easy_fuel/features/setting/widgets/menu_widget.dart';
import 'package:too_easy_fuel/widgets/app_bar_widget.dart';
import 'package:too_easy_fuel/widgets/background_widget.dart';

class TermsScreen extends GetView<SettingController> {
  const TermsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: radialBackground(
        child: Column(
          children: [
            appBar("Terms & Conditions"),
            SizedBox(height: 3.h,),
            Expanded(child: SingleChildScrollView(
              child: Column(
                children: [
                  elevatedContainer(
                    margin: 5.w,
                    vPadding: 1.h,
                    hPadding: 5.w,
                    child: customText(
                      text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed neque eros, sollicitudin ac eros non, auctor gravida risus. Nam iaculis tincidunt turpis, in ultrices justo mattis vel. Praesent tincidunt commodo faucibus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent ac odio orci. Proin ut lobortis neque, non scelerisque lorem. Nunc nunc dui, pretium nec sem vitae, tempor viverra odio. Morbi ut molestie felis. In in sapien tortor. Nam porta et augue vel molestie. Duis hendrerit ac arcu ac vestibulum. Donec congue venenatis lectus, vitae commodo justo dictum et.  Morbi eget ultricies orci, quis ultricies enim. Maecenas varius ut ex vel fringilla. Suspendisse eu odio ullamcorper, feugiat nisi pharetra, congue enim. Curabitur vitae nisl eget diam tempor ultricies id et justo. Etiam vitae ante placerat, fermentum risus a, feugiat tortor. Proin ac lorem tellus. Praesent cursus nibh at condimentum semper. Curabitur neque leo, tristique at leo ut, sollicitudin egestas magna.  Ut a dui vel ligula pharetra fermentum vel nec est. Integer at ligula metus. Maecenas ut porttitor arcu. Vestibulum pretium bibendum nunc vitae laoreet. Praesent lobortis tellus et sem dignissim, sit amet tincidunt nisl posuere. Fusce pulvinar neque sit amet dictum porta. Curabitur imperdiet nisl ante, id pulvinar nisl condimentum ac. Nullam suscipit auctor elementum."
                    )
                  ),
                  SizedBox(height: 4.h,)
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }

}