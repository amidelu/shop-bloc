import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_shop_bloc/common/values/app_colors.dart';
import 'package:learning_shop_bloc/pages/home/home_page.dart';
import 'package:learning_shop_bloc/pages/profile/profile_page.dart';

Widget buildPage(int index) {
  List<Widget> pages = [
    const HomePage(),
    const Center(child: Text('Search')),
    const Center(child: Text('Course')),
    const Center(child: Text('Chat')),
    const ProfilePage(),
  ];

  return pages[index];
}

var bottomTabs = [
  BottomNavigationBarItem(
    label: 'home',
    icon: Image.asset('assets/icons/home.png',
        height: 15.h, width: 15.w),
    activeIcon: Image.asset('assets/icons/home.png',
        height: 15.h,
        width: 15.w,
        color: AppColors.primaryElement),
  ),
  BottomNavigationBarItem(
    label: 'search',
    icon: Image.asset('assets/icons/search2.png',
        height: 15.h, width: 15.w),
    activeIcon: Image.asset('assets/icons/search2.png',
        height: 15.h,
        width: 15.w,
        color: AppColors.primaryElement),
  ),
  BottomNavigationBarItem(
    label: 'course',
    icon: Image.asset('assets/icons/play-circle1.png',
        height: 15.h, width: 15.w),
    activeIcon: Image.asset('assets/icons/play-circle1.png',
        height: 15.h,
        width: 15.w,
        color: AppColors.primaryElement),
  ),
  BottomNavigationBarItem(
    label: 'chat',
    icon: Image.asset('assets/icons/message-circle.png',
        height: 15.h, width: 15.w),
    activeIcon: Image.asset('assets/icons/message-circle.png',
        height: 15.h,
        width: 15.w,
        color: AppColors.primaryElement),
  ),
  BottomNavigationBarItem(
    label: 'profile',
    icon: Image.asset('assets/icons/person2.png',
        height: 15.h, width: 15.w),
    activeIcon: Image.asset('assets/icons/person2.png',
        height: 15.h,
        width: 15.w,
        color: AppColors.primaryElement),
  ),
];