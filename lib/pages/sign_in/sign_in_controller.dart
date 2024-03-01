import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_shop_bloc/common/values/constant.dart';
import 'package:learning_shop_bloc/common/widgets/custom_toast.dart';
import 'package:learning_shop_bloc/global.dart';

import 'bloc/bloc/sign_in_bloc.dart';

class SignInController {
  final BuildContext context;
  const SignInController({required this.context});

  void handleSignIn(String type) async {
    try {
      if (type == 'email') {
        final state = context.read<SignInBloc>().state;
        String emailAddress = state.email;
        String password = state.password;
        if (emailAddress.isEmpty) {
          customToast(msg: 'Email is required');
          return;
        }
        if (password.isEmpty) {
          customToast(msg: 'Password is required');
          return;
        }

        try {
          final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailAddress,
            password: password,
          );

          if (credential.user == null) {
            customToast(msg: 'This account is not exist');
            return;
          }

          /*if (!credential.user!.emailVerified) {
            customToast(msg: 'Need to verify your email account');
            return;
          }*/
          
          final user = credential.user;
          if (user != null) {
            Navigator.of(context).pushNamedAndRemoveUntil('application', (route) => false);
            Global.storageService.setBool(AppConstants.isLoggedIn, true);
          }

        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            debugPrint('No User Found for that Email');
            customToast(msg: 'No User Found for that Email');
          } else if (e.code == 'wrong-password') {
            debugPrint('The Password is Wrong');
            customToast(msg: 'The Password is Wrong');
          } else if (e.code == 'invalid-email') {
            debugPrint('Email is Invalid');
            customToast(msg: 'Email is Invalid');
          }
        }
      }
    } catch (e) {
      debugPrint('Error from $runtimeType top try block: $e');
    }
  }
}
