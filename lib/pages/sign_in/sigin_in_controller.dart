import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app_bloc_provider/global.dart';

import '../../common/value/constant.dart';
import 'bloc/sign_in_blocs.dart';

class SignInController {
  final BuildContext context;

  SignInController({required this.context});

  Future<void> handeleSignIn(String type) async {
    try {
      if (type == "email") {
        final state = context.read<SignInBlocs>().state;
        String emailAdress = state.email;
        String password = state.password;
        if (emailAdress.isNotEmpty && password.isNotEmpty) {
          print("Email: $emailAdress, Password: $password");
        }
        try {
          final credential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: emailAdress, password: password);
          if (credential.user == null) {

          }
          if (!credential.user!.emailVerified == false) {

          }
          var user = credential.user;
          if (user != null) {
            Global.storageService.setString(
                AppConstant.STORAGE_USER_TOKEN_KEY, "1234567890");
            print("User exist: ${user.email}");
          } else {
            print("User: null");
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            print('no user found for that email');
          } else if (e.code == 'wrong-password') {
            print('wrong password provided for that user');
          }else if (e.code == 'invalid-email') {
            print('invalid email provided');
          }
        }
      }
    } catch (e) {
      // Handle any other exceptions here
    }
  }
}