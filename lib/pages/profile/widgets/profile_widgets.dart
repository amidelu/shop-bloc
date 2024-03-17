import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_shop_bloc/common/routes/app_routes.dart';
import 'package:learning_shop_bloc/common/values/app_colors.dart';
import 'package:learning_shop_bloc/global_widgets/base_text_widget.dart';

AppBar buildAppbar() {
  return AppBar(
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 18.w,
          height: 12.h,
          child: Image.asset('assets/icons/menu.png'),
        ),
        baseTextWidget('Profile'),
        SizedBox(
          width: 24.w,
          height: 24.h,
          child: Image.asset('assets/icons/more-vertical.png'),
        ),
      ],
    ),
  );
}

Widget profileIconAndEditButton() {
  return Container(
    width: 80.w,
    height: 80.w,
    decoration: const BoxDecoration(
      image: DecorationImage(
        image: AssetImage(
            'assets/icons/headpic.png'
        ),
      ),
    ),
    alignment: Alignment.bottomRight,
    child: Image.asset('assets/icons/edit_3.png', height: 25.w, width: 25.w,),
  );
}

final imagesInfo = <String, String> {
  'Settings': 'settings.png',
  'Payment Details': 'credit-card.png',
  'Achievement': 'award.png',
  'Love': 'heart(1).png',
  'Reminders': 'cube.png'
};

Widget buildListView(BuildContext context) {
  return Column(
    children: [
      ...List.generate(imagesInfo.length, (index) => GestureDetector(
        onTap: () => Navigator.of(context).pushNamed(AppRoutes.settingsPage),
        child: Container(
          margin: EdgeInsets.only(bottom: 15.r),
          child: Row(
            children: [
              Container(
                width: 40.w,
                height: 40.h,
                padding: EdgeInsets.all(7.r),
                decoration: BoxDecoration(
                  color: AppColors.primaryElement,
                  borderRadius: BorderRadius.circular(10.w),
                ),
                child: Image.asset('assets/icons/${imagesInfo.values.elementAt(index)}'),
              ),
              SizedBox(width: 15.w),
              Text(
                imagesInfo.keys.elementAt(index),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryText,
                  fontSize: 16.sp,
                ),
              ),
            ],
          ),
        ),
      ),),
    ],
  );
}