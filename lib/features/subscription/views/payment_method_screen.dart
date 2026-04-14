import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:too_easy_fuel/features/auth/controller/auth_controller.dart';
import 'package:too_easy_fuel/widgets/background_widget.dart';
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
    return Scaffold(
      body: radialBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [
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
                        Expanded(child: emailTextFeild("Expiry Date", "Month", "assets/png/subscription_image/calender.png", auth,showSuffix: true)),
                        SizedBox(width: 3.w),
                        Expanded(child: emailTextFeild(" ", "Year", "assets/png/subscription_image/calender.png", auth, isPaymentScreen: true,showSuffix: true)),
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
