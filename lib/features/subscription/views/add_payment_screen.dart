import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:too_easy_fuel/widgets/background_widget.dart';

import '../../../../constants/color_constants.dart';
import '../../../../widgets/button_widget.dart';
import '../../../../widgets/customText_widget.dart';
import '../../../../widgets/simple_app_bar.dart';
import '../../orders/widget/invoice_dialog_widget.dart';
import '../controller/subscription_controller.dart';

class AddPaymentScreen extends StatelessWidget {
  final SubscriptionController controller = Get.put(SubscriptionController());

  AddPaymentScreen({super.key});

  Widget _paymentMethodItem(String title, String subtitle, String methodId, {Widget? prefixIcon, Widget? suffix}) {
    return Obx(() {
      bool isSelected = controller.selectedPaymentMethod.value == methodId;
      return GestureDetector(
        onTap: () {
          controller.selectPaymentMethod(methodId);
        },
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 0.5.h),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 3.w),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.06),
              borderRadius: BorderRadius.circular(10.sp),
            ),
            child: Row(
              children: [
                if (prefixIcon != null) ...[
                  prefixIcon,
                  SizedBox(width: 3.w),
                ],
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      customText(
                        text: title,
                        color: blackColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      SizedBox(height: 0.3.h),
                      Row(
                        children: [
                          customText(
                            text: subtitle,
                            color: Colors.black54,
                            fontSize: 15.sp,
                          ),
                          SizedBox(width: 1.w),
                          isSelected ?
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 0.2.h),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(8.sp),
                            ),
                            child: customText(text: "Default", fontSize: 14.sp, color: blackColor,fontWeight: FontWeight.w600),
                          ):SizedBox.shrink()
                        ],
                      ),
                    ],
                  ),
                ),
                Icon(
                  isSelected ? Icons.radio_button_checked : Icons.radio_button_unchecked,
                  color: isSelected ? blackColor : borderGreyColor,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: radialBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [
              simpleAppBar("Add Payment", isBack: true, spacing: 16.w),
              SizedBox(height: 3.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: whiteColor,
                    border: Border.all(
                      color: blackColor.withValues(alpha: 0.12),
                      width: 0.25.w,
                    ),
                    borderRadius: BorderRadius.circular(17.sp),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.08),
                        blurRadius: 8,
                        spreadRadius: 1,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        customText(
                          text: "Your Card",
                          color: blueAppBarColor,
                          fontFamily: "bl_melody",
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                          height: 0.13.h,
                        ),
                        SizedBox(height: 2.h),
                        _paymentMethodItem(
                          "Card",
                          "VISA  **** **** **** 2512",
                          "card",
                          prefixIcon: Image.asset("assets/png/subscription_image/card.png",width: 6.w),
                        ),
                        _paymentMethodItem(
                          "Digital Wallet",
                          "Apple Pay / Google Pay",
                          "wallet",
                          prefixIcon: Image.asset("assets/png/subscription_image/bank.png",width: 6.w),
                        ),
                        _paymentMethodItem(
                          "Bank Transfer",
                          "Direct bank payment",
                          "bank",
                          prefixIcon: Image.asset("assets/png/subscription_image/wallet.png",width: 6.w),
                        ),
                        SizedBox(height: 2.h),
                        buttonWidget(
                          "Use Another Card",
                          blueAppBarColor,
                          borderColor: blueAppBarColor,
                          fontsize: 15.5.sp,
                          height: 5.h,
                          onTap: (){
                            Get.toNamed("PaymentMethod");
                          }
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 3.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: Row(
                  children: [
                    Image.asset("assets/png/subscription_image/lock.png",width: 7.w),
                    SizedBox(width: 3.w),
                    Expanded(
                      child: customText(
                        text: "Secure payment by Stripe. Your payment information is encrypted and secure.",
                        fontSize: 15.sp,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 4.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: buttonWidget(
                  "Complete Payment",
                  whiteColor,
                  isGradient: true,
                  height: 6.h,
                  fontsize: 15.5.sp,
                  onTap: () {
                    invoiceDialog(context,isSubscription: true);
                  }
                ),
              ),
              SizedBox(height: 4.h),
            ],
          ),
        ),
      ),
    );
  }
}
