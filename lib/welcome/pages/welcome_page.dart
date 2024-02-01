import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_shop_bloc/common/values/colors.dart';
import 'package:learning_shop_bloc/dashboard/dashboard_page.dart';

import '../bloc/welcome_bloc.dart';
import '../bloc/welcome_event.dart';
import '../bloc/welcome_state.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<WelcomeBloc, WelcomeState>(
        builder: (context, state) {
          return Container(
            margin: EdgeInsets.only(top: 34.h),
            width: 375.w,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                PageView(
                  controller: controller,
                  onPageChanged: (index) {
                    state.page = index;
                    BlocProvider.of<WelcomeBloc>(context).add(WelcomeEvent());
                  },
                  children: [
                    _page(
                        1,
                        context,
                        'assets/images/reading.png',
                        'First See Learning',
                        'Forget about a for of paper all knowledge in one learning!',
                        'Next'),
                    _page(
                        2,
                        context,
                        'assets/images/boy.png',
                        'Connect With Everyone',
                        'Always keep in touch with your tutor and friends.',
                        'Next'),
                    _page(
                        3,
                        context,
                        'assets/images/man.png',
                        'Always Fascinated',
                        'Anywhere anytime. The time is at our discretion',
                        'Get Started'),
                  ],
                ),
                Positioned(
                  bottom: 100.h,
                  child: DotsIndicator(
                    position: state.page,
                    dotsCount: 3,
                    decorator: DotsDecorator(
                      color: AppColors.primaryThirdElementText,
                      activeColor: AppColors.primaryElement,
                      size: const Size.square(8.0),
                      activeSize: const Size(18.0, 8.0),
                      activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _page(int index, BuildContext context, String imagePath, String title,
          String subTitle, String buttonText) =>
      Column(
        children: [
          SizedBox(
            width: 345.w,
            height: 345.w,
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            title,
            style: TextStyle(color: AppColors.primaryText, fontSize: 24.sp),
          ),
          Container(
            width: 375.w,
            padding: EdgeInsets.only(left: 30.r, right: 30.r),
            child: Text(
              subTitle,
              style: TextStyle(
                  color: Colors.black.withOpacity(0.5), fontSize: 14.sp),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (index < 3) {
                // Animation
                controller.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeIn,
                );
              } else {
                // Jump to next page and remove welcome pages
                Navigator.of(context)
                    .pushNamedAndRemoveUntil('signIn', (route) => false);
              }
            },
            child: Container(
              margin: EdgeInsets.only(top: 100.r, left: 25.r, right: 25.r),
              width: 375.w,
              height: 50.h,
              decoration: BoxDecoration(
                  color: AppColors.primaryElement,
                  borderRadius: BorderRadius.all(Radius.circular(15.r)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.green.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: const Offset(0, 2),
                    )
                  ]),
              child: Center(
                child: Text(
                  buttonText,
                  style: const TextStyle(color: AppColors.primaryBackground),
                ),
              ),
            ),
          )
        ],
      );
}
