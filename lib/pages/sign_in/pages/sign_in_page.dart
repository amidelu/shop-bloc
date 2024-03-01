import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:learning_shop_bloc/common/values/app_colors.dart';
import 'package:learning_shop_bloc/pages/sign_in/bloc/bloc/sign_in_bloc.dart';
import 'package:learning_shop_bloc/pages/sign_in/bloc/bloc/sign_in_state.dart';

import '../../../global_widgets/global_widgets.dart';
import '../bloc/bloc/sign_in_event.dart';
import '../sign_in_controller.dart';
import 'widgets/sign_in_widget.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Log In',
            style: TextStyle(fontSize: 16.sp),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SignInWidget(),
              Center(child: reusableText('Or use your email account to login')),
              BlocBuilder<SignInBloc, SignInState>(
                builder: (context, state) => Container(
                  margin: EdgeInsets.only(top: 65.h),
                  padding: EdgeInsets.symmetric(horizontal: 25.r),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      reusableText('Email'),
                      CustomTextFormField(
                        hintText: 'Enter your email address',
                        imagePath: 'user',
                        keyboardType: TextInputType.multiline,
                        onChanged: (value) {
                          context.read<SignInBloc>().add(EmailEvent(value!));
                        },
                      ),
                      reusableText('Password'),
                      CustomTextFormField(
                        hintText: 'Enter your password',
                        imagePath: 'lock',
                        keyboardType: TextInputType.visiblePassword,
                        onChanged: (value) {
                          context.read<SignInBloc>().add(PasswordEvent(value!));
                        },
                      ),
                      forgotPassword(),
                      Gap(20.r),
                      buildLogAndRegButton(buttonName: 'Login', func: () {
                        SignInController(context: context).handleSignIn('email');

                      }),
                      buildLogAndRegButton(buttonName: 'Register', buttonColor: AppColors.primaryBackground, func: () {
                        Navigator.pushNamed(context, 'register');
                      }),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
