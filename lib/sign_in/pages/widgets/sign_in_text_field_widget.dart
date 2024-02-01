import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInTextFieldWidget extends StatelessWidget {
  const SignInTextFieldWidget({super.key, this.hintText, this.imagePath, this.keyboardType, this.obscure = false});

  final String? hintText;
  final String? imagePath;
  final TextInputType? keyboardType;
  final bool? obscure;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.h),
      child: TextFormField(
        keyboardType: keyboardType,
        obscureText: obscure! ? true : false,
        decoration: InputDecoration(
          hintText: hintText,
          prefix: Image.asset('assets/icons/$imagePath.png'),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.red),
          ),
        ),
      ),
    );
  }
}
