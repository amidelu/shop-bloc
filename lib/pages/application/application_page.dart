import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_shop_bloc/common/values/colors.dart';
import 'package:learning_shop_bloc/pages/application/widgets/application_widgets.dart';

class ApplicationPage extends StatefulWidget {
  const ApplicationPage({super.key});

  @override
  State<ApplicationPage> createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: buildPage(_index),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: AppColors.primaryElement,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.h),
              topRight: Radius.circular(20.h),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 1
              )
            ]
          ),
          child: BottomNavigationBar(
            currentIndex: _index,
            onTap: (value) {
              setState(() {
                _index = value;
              });
            },
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedItemColor: AppColors.primaryElement,
            unselectedItemColor: AppColors.primaryFourthElementText,
            items: [
              BottomNavigationBarItem(
                label: 'home',
                icon: Image.asset('assets/icons/home.png', height: 15.h, width: 15.w),
                activeIcon: Image.asset('assets/icons/home.png', height: 15.h, width: 15.w, color: AppColors.primaryElement),
              ),
              BottomNavigationBarItem(
                label: 'search',
                icon: Image.asset('assets/icons/search2.png', height: 15.h, width: 15.w),
                activeIcon: Image.asset('assets/icons/search2.png', height: 15.h, width: 15.w, color: AppColors.primaryElement),
              ),
              BottomNavigationBarItem(
                label: 'course',
                icon: Image.asset('assets/icons/play-circle1.png', height: 15.h, width: 15.w),
                activeIcon: Image.asset('assets/icons/play-circle1.png', height: 15.h, width: 15.w, color: AppColors.primaryElement),
              ),
              BottomNavigationBarItem(
                label: 'chat',
                icon: Image.asset('assets/icons/message-circle.png', height: 15.h, width: 15.w),
                activeIcon: Image.asset('assets/icons/message-circle.png', height: 15.h, width: 15.w, color: AppColors.primaryElement),
              ),
              BottomNavigationBarItem(
                label: 'profile',
                icon: Image.asset('assets/icons/person2.png', height: 15.h, width: 15.w),
                activeIcon: Image.asset('assets/icons/person2.png', height: 15.h, width: 15.w, color: AppColors.primaryElement),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
