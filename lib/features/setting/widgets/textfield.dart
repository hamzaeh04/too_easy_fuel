import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget textfield({int? maxLines}){
  return TextField(
    maxLines: maxLines ?? 1,
    decoration: InputDecoration(
      border: InputBorder.none,
      enabledBorder: InputBorder.none,
      focusedBorder: InputBorder.none,
      disabledBorder: InputBorder.none,
      errorBorder: InputBorder.none,
      focusedErrorBorder: InputBorder.none,
    ),
  );
}