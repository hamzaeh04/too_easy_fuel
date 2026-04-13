import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';

import '../../../widgets/customText_widget.dart';

Widget subscriptionPaymentRow(String title,double price,{FontWeight? titlefontweight}){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      customText(
        text:
        title,
        fontSize: 15.sp,
        textAlign: TextAlign.center,
        fontWeight: titlefontweight ?? FontWeight.w400
      ),
      customText(
        text: "\$ ${price}",
        fontSize: 15.sp,
        textAlign: TextAlign.center,
        fontWeight: FontWeight.w600
      ),
    ],
  );
}
