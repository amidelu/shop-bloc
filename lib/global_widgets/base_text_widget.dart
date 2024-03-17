import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_shop_bloc/common/values/app_colors.dart';

Widget baseTextWidget(
    String text, {
      Color color = AppColors.primaryText,
      int fontSize = 16,
      FontWeight fontWeight = FontWeight.bold,
    }) {
  return Text(
    text,
    style: TextStyle(
      fontSize: fontSize.sp,
      color: color,
      fontWeight: fontWeight,
    ),
  );
}