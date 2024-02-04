import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../global_widgets/global_widgets.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(child: reusableText('Or use your email account to login')),
            Container(
              margin: EdgeInsets.only(top: 65.h),
              padding: EdgeInsets.symmetric(horizontal: 25.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  reusableText('Username'),
                  CustomTextFormField(
                    hintText: 'Enter your username',
                    imagePath: 'user',
                    keyboardType: TextInputType.multiline,
                    onChanged: (value) {
                      // context.read<SignInBloc>().add(EmailEvent(value!));
                    },
                  ),
                  reusableText('Email'),
                  CustomTextFormField(
                    hintText: 'Enter your email address',
                    imagePath: 'user',
                    keyboardType: TextInputType.multiline,
                    onChanged: (value) {
                      // context.read<SignInBloc>().add(EmailEvent(value!));
                    },
                  ),
                  reusableText('Password'),
                  CustomTextFormField(
                    hintText: 'Enter your password',
                    imagePath: 'lock',
                    keyboardType: TextInputType.multiline,
                    onChanged: (value) {
                      // context.read<SignInBloc>().add(PasswordEvent(value!));
                    },
                  ),
                  reusableText('Confirm Password'),
                  CustomTextFormField(
                    hintText: 'Enter your password again',
                    imagePath: 'lock',
                    keyboardType: TextInputType.multiline,
                    onChanged: (value) {
                      // context.read<SignInBloc>().add(PasswordEvent(value!));
                    },
                  ),
                  forgotPassword(),
                  Gap(20.r),
                  buildLogAndRegButton(buttonName: 'Register', func: () {}),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
