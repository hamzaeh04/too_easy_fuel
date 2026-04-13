import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:too_easy_fuel/features/orders/widget/invoice_dialog_widget.dart';
import 'package:too_easy_fuel/widgets/background_widget.dart';

import '../../../constants/color_constants.dart';
import '../../../widgets/button_widget.dart';
import '../../../widgets/customText_widget.dart';
import '../../../widgets/plan_card.dart';
import '../../../widgets/simple_app_bar.dart';
import '../widgets/subscription_payment_roe_widget.dart';

class SubscriptionPayment extends StatelessWidget {
  const SubscriptionPayment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: radialBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [
              simpleAppBar("Subscription Payment",isBack: true,spacing: 8.w),
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
          
                    /// 🔥 ADD THIS
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.08), // light shadow
                        blurRadius: 8,  // softness
                        spreadRadius: 1, // slight spread
                        offset: Offset(0, 3), // shadow below
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        customText(
                          text: "Payment Details",
                          color: blueAppBarColor,
                          fontFamily: "bl_melody",
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                          height: 0.13.h,
                        ),
                        SizedBox(height: 0.1.h),
                        Divider(),
                        SizedBox(height: 1.h),
                        Row(
                          spacing: 16.w,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                customText(
                                  text:
                                  "Subscription Plan",
                                  fontSize: 15.sp,
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: 0.3.h),
                                customText(
                                  text: "Payment Details",
                                  color: blueAppBarColor,
                                  fontFamily: "bl_melody",
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w700,
                                  height: 0.13.h,
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                customText(
                                  text:
                                  "Date",
                                  fontSize: 15.sp,
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: 0.3.h),
                                customText(
                                  text: "20 Dec 2026",
                                  color: blueAppBarColor,
                                  fontFamily: "bl_melody",
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w700,
                                  height: 0.13.h,
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 0.5.h),
                        Divider(
                          // lighter grey
                        ),
                        SizedBox(height: 1.h),
                        customText(
                          text:
                          "Amount",
                          fontSize: 15.sp,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 0.3.h),
                        customText(
                          text: "\$${100.00}",
                          color: blueAppBarColor,
                          fontFamily: "bl_melody",
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                          height: 0.13.h,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 2.h),
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
          
                    /// 🔥 ADD THIS
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.08), // light shadow
                        blurRadius: 8,  // softness
                        spreadRadius: 1, // slight spread
                        offset: Offset(0, 3), // shadow below
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        subscriptionPaymentRow("Sub Total", 5870),
                        SizedBox(height: 2.h),
                        subscriptionPaymentRow("Tax", 10),
                        SizedBox(height: 2.h),
                        subscriptionPaymentRow("Discount", 10),
                        SizedBox(height: 2.h),
                        subscriptionPaymentRow("Fees", 2),
                        SizedBox(height: 1.h),
                        Divider(),
                        SizedBox(height: 0.5.h),
                        subscriptionPaymentRow("Total", 5950,titlefontweight: FontWeight.w600),
                        SizedBox(height: 2.h),
          
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: Column(
                  children: [
                    SizedBox(height: 5.h),
                    buttonWidget("Pay Now", whiteColor,isGradient: true,height: 6.h,fontsize: 15.5.sp,onTap: (){
                      invoiceDialog(context,isSubscription: true);
                    }),
                    SizedBox(height: 2.h),
                    buttonWidget(
                      "Select Plan",
                      blueAppBarColor,
                      borderColor: blueAppBarColor,
                      fontsize: 15.5.sp,
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
