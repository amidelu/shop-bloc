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
              child: Image.asset('assets/icons/search.png', height: 16.w, width: 16.w,),
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
        position: 1,
        dotsCount: state.index,
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
              )
            ),
          );
}