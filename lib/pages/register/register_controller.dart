import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_shop_bloc/common/widgets/custom_toast.dart';
import 'package:learning_shop_bloc/environment.dart';
import 'package:learning_shop_bloc/pages/register/bloc/register_bloc.dart';

class RegisterController {
  final BuildContext context;
  const RegisterController(this.context);

  Future<void> handleEmailRegister() async {
    final state = context.read<RegisterBloc>().state;

    String username = state.username;
    String email = state.email;
    String password = state.password;
    String rePassword = state.rePassword;

    // Setting Validation
    if (username.isEmpty) {
      customToast(msg: 'Username is required!');
    } else if (email.isEmpty) {
      customToast(msg: 'Email is required!');
    } else if (password.isEmpty) {
      customToast(msg: 'Password is required!');
    } else if (rePassword.isEmpty) {
      customToast(msg: 'Password is not matched!');
    }

    // Firebase call
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);

      if (credential.user != null) {
        // await credential.user?.sendEmailVerification();
        await credential.user?.updateDisplayName(username);
        String photoUrl = 'uploads/default.png';
        await credential.user?.updatePhotoURL(photoUrl);
        customToast(msg: 'Please login using email and password');
        // Going to previous page
        Navigator.of(context).pop();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        customToast(msg: 'Provided password is weak');
      } else if (e.code == 'email-already-in-use') {
        customToast(msg: 'Provided email already exists');
      } else if (e.code == 'invalid-email') {
        customToast(msg: 'Provided email is invalid');
      }
    }
  }
}