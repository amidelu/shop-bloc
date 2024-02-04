import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.hintText,
    this.imagePath,
    this.keyboardType,
    this.obscure = false,
    this.onChanged,
  });

  final String? hintText;
  final String? imagePath;
  final TextInputType? keyboardType;
  final bool? obscure;
  final void Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.h),
      child: TextFormField(
        keyboardType: keyboardType,
        obscureText: obscure! ? true : false,
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding: const EdgeInsets.all(10.0),
          prefix: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Image.asset('assets/icons/$imagePath.png', height: 24.0, width: 24.0, color: Colors.black,),
          ),
          border: InputBorder.none,
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
        onChanged: onChanged,
      ),
    );
  }
}
