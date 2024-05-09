import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:learning_shop_bloc/common/apis/user_api.dart';
import 'package:learning_shop_bloc/common/entities/entities.dart';
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
          final credential =
              await FirebaseAuth.instance.signInWithEmailAndPassword(
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
            String? displayName = user.displayName;
            String? email = user.email;
            String? id = user.uid;
            String? photoUrl = user.photoURL;
            LoginRequestEntity loginRequestEntity = LoginRequestEntity();
            loginRequestEntity.avatar = photoUrl;
            loginRequestEntity.name = displayName;
            loginRequestEntity.email = email;
            loginRequestEntity.openId = id;
            // Type 1 means register by email
            loginRequestEntity.type = 1;

            loginRequest(loginRequestEntity);
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

  // API calling method
  void loginRequest(LoginRequestEntity loginRequestEntity) async {
    EasyLoading.show(
      indicator: const CircularProgressIndicator(),
      maskType: EasyLoadingMaskType.clear,
      dismissOnTap: true,
    );
    var result = await UserAPI.logIn(loginRequestEntity);

    if (result.code == 200) {
      try {
        Global.storageService.setString(AppConstants.userProfile, jsonEncode(result.data!));
        // Used for authorization
        Global.storageService.setString(AppConstants.userTokenKey, result.data!.accessToken!);
        EasyLoading.dismiss();
        // For checking if the context is available and removing warning
        if (context.mounted) {
          Navigator.of(context).pushNamedAndRemoveUntil('application', (route) => false);
        }
      } catch (e) {
        debugPrint('Saving local storage error: ${e.toString()}');
      }
    } else {
      EasyLoading.dismiss();
      customToast(msg: 'Unknown Error');
    }
  }
}
