import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/registre_bloc.dart';


class SignUpController {
  final BuildContext context;

  SignUpController({required this.context});

  Future<void> handleSignUp(String type) async {
    try {
      if (type == "email") {
        final state = context.read<RegisterBloc>().state;
        String? userName = state.userName;
        String? email = state.email;
        String? password = state.password;
        String? rePassword = state.rePassword;

        if (password == rePassword) {
          try {
            final credential = await FirebaseAuth.instance
                .createUserWithEmailAndPassword(
                email: email, password: password);

            if (credential.user != null) {
              var user = credential.user;
              if (!user!.emailVerified) {
                await user.sendEmailVerification();
                print("Verification email sent to ${user.email}");
              }
              print("User registered: ${user.email}");

              // Optionally, update the user profile with the userName
              if (userName.isNotEmpty) {
                await user.updateProfile(displayName: userName);
                await user.reload();
                print("User name set to: $userName");
              }
            } else {
              print("User registration failed.");
            }
          } on FirebaseAuthException catch (e) {
            if (e.code == 'email-already-in-use') {
              print('The account already exists for that email.');
            } else if (e.code == 'weak-password') {
              print('The password provided is too weak.');
            } else if (e.code == 'invalid-email') {
              print('The email address is not valid.');
            }
          }
        } else {
          print('Passwords do not match.');
        }
            }
    } catch (e) {
      // Handle any other exceptions here
      print('An unexpected error occurred: $e');
    }
  }
}
