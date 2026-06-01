import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:too_easy_fuel/features/auth/controller/auth_controller.dart';
import 'package:too_easy_fuel/widgets/app_bar_widget.dart';
import 'package:too_easy_fuel/widgets/background_widget.dart';
import 'package:too_easy_fuel/widgets/custom_dialog_widget.dart';
import 'package:too_easy_fuel/widgets/custom_text_feild.dart';

import '../../../../constants/color_constants.dart';
import '../../../../widgets/button_widget.dart';
import '../../../../widgets/customText_widget.dart';
import '../../../../widgets/simple_app_bar.dart';
import '../../orders/widget/invoice_dialog_widget.dart';

class PaymentMethodScreen extends StatelessWidget {
  PaymentMethodScreen({super.key});

  final AuthController auth = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    final isButton = Get.arguments;
    return Scaffold(
      body: radialBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [
              isButton == false ? appBar("New Card"):
              simpleAppBar("Payment Method", isBack: true, spacing: 14.w),
              SizedBox(height: 3.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: Column(
                  children: [
                    emailTextFeild(
                      "Cardholder Name",
                      "Enter cardholder name",
                      "assets/png/auth_image/field-icons-user.png",
                      auth,

                    ),
                    SizedBox(height: 2.h),
                    emailTextFeild(
                      "Credit/Debit Card No",
                      "Enter your card number",
                      "assets/png/subscription_image/grey_card.png",
                      auth,
                    ),
                    SizedBox(height: 2.h),
                    Row(
                      children: [
                        Expanded(child: emailTextFeild(controller: auth.expiryMonthController, "Expiry Date", "Month", "assets/png/subscription_image/calender.png", auth,showSuffix: true,
                          suffixIcon: PopupMenuButton<String>(
                          color: whiteColor, // ✅ background color
                          surfaceTintColor: whiteColor, // ✅ fixes Material 3 tint issue
                          elevation: 6,
                          offset: Offset(15, 25),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          icon: Icon(Icons.keyboard_arrow_down_sharp, size: 20.sp),
                          onSelected: (value) {
                            auth.expiryMonthController.text = value;
                          },
                          itemBuilder: (context) => [
                            PopupMenuItem(
                              enabled: false, // disables auto-select behavior
                              child: SizedBox(
                                height: 20.h, // 👈 approx height for 4 items
                                child: Scrollbar(
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: auth.months.map((m) {
                                        return InkWell(
                                          onTap: () {
                                            Navigator.pop(context, m);
                                            auth.expiryMonthController.text = m;
                                          },
                                          child: Container(
                                            alignment: Alignment.centerLeft,
                                            padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
                                            child: customText(text: m, color: blackColor),
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),)),
                        SizedBox(width: 3.w),
                        Expanded(child: emailTextFeild(controller: auth.expiryYearController, " ", "Year", "assets/png/subscription_image/calender.png", auth, isPaymentScreen: true,showSuffix: true,
                          suffixIcon: PopupMenuButton<String>(
                            color: whiteColor, // ✅ background color
                            surfaceTintColor: whiteColor, // ✅ fixes Material 3 tint issue
                            elevation: 6,
                            offset: Offset(15, 25),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            icon: Icon(Icons.keyboard_arrow_down_sharp, size: 20.sp),
                            onSelected: (value) {
                              auth.expiryYearController.text = value;
                            },
                            itemBuilder: (context) => [
                              PopupMenuItem(
                                enabled: false, // disables auto-select behavior
                                child: SizedBox(
                                  height: 20.h, // 👈 approx height for 4 items
                                  child: Scrollbar(
                                    child: SingleChildScrollView(
                                      child: Column(
                                        children: auth.expiryYears.map((m) {
                                          return InkWell(
                                            onTap: () {
                                              Navigator.pop(context, m);
                                              auth.expiryYearController.text = m;
                                            },
                                            child: Container(
                                              alignment: Alignment.centerLeft,
                                              padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
                                              child: customText(text: m, color: blackColor),
                                            ),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),)),
                      ],
                    ),
                    SizedBox(height: 2.h),
                    emailTextFeild(
                      "CVV",
                      "Enter CVV number",
                      "assets/png/subscription_image/cvv_card.png",
                      auth,
                    ),
                    SizedBox(height: 4.h),
                    buttonWidget("Confirm", whiteColor, isGradient: true, height: 6.h, fontsize: 15.5.sp, onTap: () {
                      customDialog(context, title: "Card added successfully!", ontap: (){

                        isButton == false ? Get.offNamed("AddPayment", arguments: isButton): Get.offNamed("AddPayment");
                      });
                    }),
                    SizedBox(height: 4.h),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
