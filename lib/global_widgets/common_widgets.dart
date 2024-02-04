import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../common/values/colors.dart';

Widget reusableIcons(String iconName) => SizedBox(
      height: 40.w,
      width: 40.w,
      child: Image.asset('assets/icons/$iconName.png'),
    );

Widget reusableText(String text) => Container(
      margin: EdgeInsets.only(top: 5.h),
      child: Text(
        text,
        style: TextStyle(
            color: Colors.grey.withOpacity(0.5),
            fontWeight: FontWeight.normal,
            fontSize: 14.sp),
      ),
    );

Widget forgotPassword() => SizedBox(
      width: 260.w,
      height: 45.h,
      child: GestureDetector(
        onTap: () {},
        child: Text(
          'Forgot Password',
          style: TextStyle(
            color: Colors.black,
            decoration: TextDecoration.underline,
            decorationColor: Colors.blue,
            fontSize: 12.sp,
          ),
        ),
      ),
    );

Widget buildLogAndRegButton(
        {required String buttonName,
        Color? buttonColor,
        void Function()? func}) =>
    GestureDetector(
      onTap: func,
      child: Container(
        margin: EdgeInsets.only(top: 20.r),
        width: double.infinity,
        height: 50.h,
        decoration: BoxDecoration(
          color: buttonColor ?? AppColors.primaryElement,
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(color: buttonColor ?? AppColors.primaryElement),
          boxShadow: [
            BoxShadow(
              spreadRadius: 1,
              blurRadius: 2,
              offset: const Offset(0, 1),
              color: Colors.grey.withOpacity(0.1),
            ),
          ],
        ),
        child: Center(
          child: Text(
            buttonName,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.normal,
              color: buttonName == 'Login'
                  ? AppColors.primaryBackground
                  : AppColors.primaryText,
            ),
          ),
        ),
      ),
    );
