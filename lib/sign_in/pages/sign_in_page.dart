import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:learning_shop_bloc/sign_in/pages/widgets/sign_in_widget.dart';
import 'package:learning_shop_bloc/sign_in/pages/widgets/sign_in_text_field_widget.dart';

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
              Container(
                margin: EdgeInsets.only(top: 65.h),
                padding: EdgeInsets.symmetric(horizontal: 25.r),
                child: Column(
                  children: [
                    reusableText('Email'),
                    const SignInTextFieldWidget(
                      hintText: 'Enter your email address',
                      imagePath: 'user',
                      keyboardType: TextInputType.multiline,
                    ),
                    reusableText('Password'),
                    const SignInTextFieldWidget(
                      hintText: 'Enter your password',
                      imagePath: 'lock',
                      keyboardType: TextInputType.multiline,
                    ),
                    forgotPassword(),
                    Gap(20.r),
                    buildLogAndRegButton('Login'),
                    buildLogAndRegButton('Register'),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
