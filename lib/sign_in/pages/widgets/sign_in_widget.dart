import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_shop_bloc/common/values/colors.dart';

class SignInWidget extends StatelessWidget {
  const SignInWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40.h, bottom: 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _reusableIcons('google'),
          _reusableIcons('apple'),
          _reusableIcons('facebook'),
        ],
      ),
    );
  }

  Widget _reusableIcons(String iconName) => SizedBox(
        height: 40.w,
        width: 40.w,
        child: Image.asset('assets/icons/$iconName.png'),
      );
}

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

Widget forgotPassword() => Container(
      margin: EdgeInsets.only(left: 25.r),
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

Widget buildLogAndRegButton(String buttonName) => GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.only(left: 25.r, right: 25.r, top: 20.r),
        width: 325.w,
        height: 50.h,
        decoration: BoxDecoration(
          color: buttonName == 'Login' ? AppColors.primaryElement : AppColors.primaryBackground,
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(color: buttonName == 'Login' ? Colors.transparent : AppColors.primaryFourthElementText),
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
              color: buttonName == 'Login' ? AppColors.primaryBackground : AppColors.primaryText,
            ),
          ),
        ),
      ),
    );
