import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:learning_shop_bloc/pages/register/bloc/register_events.dart';
import 'package:learning_shop_bloc/pages/register/register_controller.dart';

import '../../../global_widgets/global_widgets.dart';
import '../bloc/register_bloc.dart';
import '../bloc/register_states.dart';

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
        child: BlocBuilder<RegisterBloc, RegisterStates>(
          builder: (context, state) {
            return Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 25.h),
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
                          context.read<RegisterBloc>().add(UsernameEvent(value!));
                        },
                      ),
                      reusableText('Email'),
                      CustomTextFormField(
                        hintText: 'Enter your email address',
                        imagePath: 'user',
                        keyboardType: TextInputType.multiline,
                        onChanged: (value) {
                          context.read<RegisterBloc>().add(EmailEvent(value!));
                        },
                      ),
                      reusableText('Password'),
                      CustomTextFormField(
                        hintText: 'Enter your password',
                        imagePath: 'lock',
                        keyboardType: TextInputType.visiblePassword,
                        onChanged: (value) {
                          context.read<RegisterBloc>().add(PasswordEvent(value!));
                        },
                      ),
                      reusableText('Confirm Password'),
                      CustomTextFormField(
                        hintText: 'Enter your password again',
                        imagePath: 'lock',
                        keyboardType: TextInputType.visiblePassword,
                        onChanged: (value) {
                          context.read<RegisterBloc>().add(RePasswordEvent(value!));
                        },
                      ),
                      forgotPassword(),
                      Gap(20.r),
                      buildLogAndRegButton(buttonName: 'Register', func: () {
                        RegisterController(context).handleEmailRegister();
                      }),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
