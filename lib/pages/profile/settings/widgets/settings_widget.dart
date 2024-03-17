import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_shop_bloc/common/routes/app_routes.dart';
import 'package:learning_shop_bloc/common/values/constant.dart';
import 'package:learning_shop_bloc/global.dart';
import 'package:learning_shop_bloc/pages/application/bloc/app_bloc.dart';
import 'package:learning_shop_bloc/pages/application/bloc/app_event.dart';

Widget settingsButton(BuildContext context) => GestureDetector(
  onTap: () {
    showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Confirm Logout'),
          content:
          const Text('Are You Sure Want to Logout?'),
          actions: [
            TextButton(
                onPressed: () =>
                    Navigator.of(context).pop(),
                child: const Text('Cancel')),
            TextButton(
                onPressed: () {
                  context.read<AppBloc>().add(const TriggerAppEvent(0));
                  Global.storageService.removeData(
                      AppConstants.userTokenKey);
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil(
                      AppRoutes.signIn,
                          (route) => false);
                },
                child: const Text('Confirm')),
          ],
        ));
  },
  child: Container(
    height: 100.h,
    decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fitHeight,
          image: AssetImage('assets/icons/Logout.png'),
        )),
  ),
);