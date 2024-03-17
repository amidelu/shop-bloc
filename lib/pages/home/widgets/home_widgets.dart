import 'dart:ui';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:learning_shop_bloc/common/values/app_colors.dart';
import 'package:learning_shop_bloc/pages/home/bloc/home_page_bloc.dart';
import 'package:learning_shop_bloc/pages/home/bloc/home_page_event.dart';
import 'package:learning_shop_bloc/pages/home/bloc/home_page_state.dart';

import '../../../global_widgets/base_text_widget.dart';

Widget homePageText(String text,
    {Color color = AppColors.primaryText, double topMargin = 15.0}) {
  return Container(
    margin: EdgeInsets.only(top: topMargin.h),
    child: Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: 24.sp,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

Widget searchView() {
  return Row(
    children: [
      Container(
        width: 280.w,
        height: 40.h,
        decoration: BoxDecoration(
          color: AppColors.primaryBackground,
          borderRadius: BorderRadius.circular(15.h),
          border: Border.all(
            color: AppColors.primaryFourthElementText,
          ),
        ),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 17.w),
              child: Image.asset(
                'assets/icons/search.png',
                height: 16.w,
                width: 16.w,
              ),
            ),
          ],
        ),
      ),
      const Gap(5),
      GestureDetector(
        child: Container(
          width: 40.w,
          height: 40.h,
          decoration: BoxDecoration(
            color: AppColors.primaryElement,
            borderRadius: BorderRadius.circular(13.w),
            border: Border.all(color: AppColors.primaryElement),
          ),
          child: Image.asset('assets/icons/options.png'),
        ),
      )
    ],
  );
}

// For slider view
Widget sliderView(BuildContext context, HomePageState state) {
  return Column(
    children: [
      Container(
        margin: EdgeInsets.only(top: 20.h),
        width: 325.w,
        height: 160.h,
        child: PageView(
          onPageChanged: (value) {
            context.read<HomePageBloc>().add(HomePageDots(value));
          },
          children: [
            _sliderContainer(path: 'assets/icons/art.png'),
            _sliderContainer(path: 'assets/icons/image_1.png'),
            _sliderContainer(path: 'assets/icons/image_2.png'),
          ],
        ),
      ),
      DotsIndicator(
        position: state.index,
        dotsCount: 3,
        decorator: DotsDecorator(
          color: AppColors.primaryThirdElementText,
          activeColor: AppColors.primaryElement,
          size: const Size.square(5.0),
          activeSize: const Size(17.0, 5.0),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
      )
    ],
  );
}

Container _sliderContainer({String path = 'assets/icons/art.png'}) {
  return Container(
    width: 325.w,
    height: 160.h,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.h),
        image: DecorationImage(
          image: AssetImage(path),
          fit: BoxFit.fill,
        )),
  );
}

// Menu view for items
Widget menuView() {
  return Column(
    children: [
      Container(
        width: 325.w,
        margin: EdgeInsets.only(top: 15.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            baseTextWidget('Choose your course'),
            baseTextWidget('See All', color: AppColors.primaryThirdElementText, fontSize: 12),
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.only(top: 20.w),
        child: Row(
          children: [
            _reusableMenuText('All'),
            _reusableMenuText('Popular', textColor: AppColors.primaryThirdElementText, backgroundColor: Colors.white),
            _reusableMenuText('Newest', textColor: AppColors.primaryThirdElementText, backgroundColor: Colors.white),
          ],
        ),
      ),
    ],
  );
}

Widget _reusableMenuText(String menuText, {Color textColor = AppColors.primaryElementText, Color backgroundColor = AppColors.primaryElement}) {
  return Container(
    margin: EdgeInsets.only(right: 20.w),
    padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 5.h, bottom: 5.h),
    decoration: BoxDecoration(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(7.w),
    ),
    child: baseTextWidget(
      menuText,
      fontSize: 11,
      fontWeight: FontWeight.normal,
      color: textColor,
    ),
  );
}

Widget courseGrid() => Container(
  padding: EdgeInsets.all(12.r),
  decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15.w),
      image: const DecorationImage(
        image: AssetImage('assets/icons/Image_2.png'),
        fit: BoxFit.fill,
      )),
  child: Column(
    mainAxisAlignment: MainAxisAlignment.end,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Best Course for IT',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
            color: AppColors.primaryElementText,
            fontWeight: FontWeight.bold,
            fontSize: 11.sp),
      ),
      SizedBox(height: 5.h),
      Text(
        'Flutter Course',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          color: AppColors.primaryFourthElementText,
          fontSize: 8.sp,
        ),
      ),
    ],
  ),
);
