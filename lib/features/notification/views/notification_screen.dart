import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:too_easy_fuel/features/notification/controller/notification_controller.dart';
import 'package:too_easy_fuel/features/notification/widget/notification_widget.dart';
import 'package:too_easy_fuel/widgets/app_bar_widget.dart';
import 'package:too_easy_fuel/widgets/background_widget.dart';

import '../../../constants/color_constants.dart';
import '../../../constants/constants_widgets.dart';

class NotificationScreen extends GetView<NotificationController> {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: radialBackground(
          child: Column(children: [
        appBar("Notifications"),
            Expanded(child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: Column(
                  children: [
                    SizedBox(height: 3.h,),
                    Container(
                      decoration: BoxDecoration(
                        color: notificationGreyColor,
                        border: Border.all(color: darkGreyColor.withValues(alpha: 0.25)),
                        borderRadius: BorderRadius.circular(15.sp),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 4.w,
                          vertical: 1.5.h,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                customText(
                                  text: 'Showing:',
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w400,
                                  color: darkGreyColor,
                                ),
                                SizedBox(width: 2.w),
                                Container(
                                  decoration: BoxDecoration(
                                    color: whiteColor,
                                    borderRadius: BorderRadius.circular(20.sp),
                                    border: Border.all(
                                      color: darkGreyColor,
                                      width: 0.2.w,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 4.w,
                                      vertical: 0.2.h,
                                    ),
                                    child: PopupMenuButton<String>(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15.sp),
                                      ),
                                      color: whiteColor,
                                      elevation: 2,
                                      offset: const Offset(0, 35),

                                      onSelected: (String value) {
                                        controller.setFilter(value);
                                      },
                                      child: Obx(() => Row(
                                        children: [
                                          customText(
                                            text: controller.selectedFilter.value,
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.w400,
                                            color: darkGreyColor,
                                          ),
                                          SizedBox(width: 1.w),
                                          Icon(
                                            Icons.keyboard_arrow_down_rounded,
                                            size: 18.sp,
                                            color: darkGreyColor,
                                          ),
                                        ],
                                      )),

                                      itemBuilder:
                                          (context) => [
                                        const PopupMenuItem(
                                          value: 'All',
                                          child: Text('All'),
                                        ),
                                        const PopupMenuItem(
                                          value: 'Read',
                                          child: Text('Read'),
                                        ),
                                        const PopupMenuItem(
                                          value: 'Unread',
                                          child: Text('Unread'),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            InkWell(
                              onTap: () {
                              },
                              child: customText(
                                text: 'Mark As All Read',
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w700,
                                color: redAppBarColor,
                                txtDecoration: TextDecoration.underline,
                                decorationColor: redAppBarColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 2.h,),
                    notificationWidget("Sed rhoncus sapien nunc eget odio. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean euismod bibendum laoreet. Proin gravida dolor sit amet lacus accumsan et viverra justo commodo. Proin sodales pulvinar tempor.", time: "12:045 PM", date: "20 June 2025", isRead: true),
                    notificationWidget(
                      "Sed rhoncus sapien nunc eget odio. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean euismod bibendum laoreet. Proin gravida dolor sit amet lacus accumsan et viverra justo commodo. Proin sodales pulvinar tempor.",
                      time: "12:45 PM",
                      date: "20 June 2025",
                    ),
                    notificationWidget(
                      "Sed rhoncus sapien nunc eget odio. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean euismod bibendum laoreet. Proin gravida dolor sit amet lacus accumsan et viverra justo commodo. Proin sodales pulvinar tempor.",
                      time: "01:30 PM",
                      date: "21 June 2025",
                    ),
                    notificationWidget(
                      "Sed rhoncus sapien nunc eget odio. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean euismod bibendum laoreet. Proin gravida dolor sit amet lacus accumsan et viverra justo commodo. Proin sodales pulvinar tempor.",
                      time: "01:30 PM",
                      date: "21 June 2025",
                    ),
                    notificationWidget(
                      "Sed rhoncus sapien nunc eget odio. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean euismod bibendum laoreet. Proin gravida dolor sit amet lacus accumsan et viverra justo commodo. Proin sodales pulvinar tempor.",
                      time: "01:30 PM",
                      date: "21 June 2025",
                    ),
                  ],
                ),
              ),
            ))
      ],)),
    );
  }

}