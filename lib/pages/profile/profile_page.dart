import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_shop_bloc/pages/profile/widgets/profile_widgets.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar(),
      body: SingleChildScrollView(
        child: SizedBox(
          width: 1.sw,
          child: Column(
            children: [
              profileIconAndEditButton(),
              SizedBox(height: 30.h),
              Padding(
                padding: EdgeInsets.only(left: 25.r),
                child: buildListView(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
