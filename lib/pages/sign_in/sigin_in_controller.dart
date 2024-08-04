import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app_bloc_provider/global.dart';
import '../../common/value/constant.dart';
import 'bloc/sign_in_blocs.dart';



class SignInController {
  final BuildContext context;

  const SignInController({required this.context});

  Future<bool> handleSignIn(String type) async {
    if (type != "email") return false;

    final state = context.read<SignInBlocs>().state;
    final String emailAddress = state.email;
    final String password = state.password;

    if (kDebugMode) {
      print('Email: $emailAddress, Password: $password');
    }

    if (emailAddress.isEmpty || password.isEmpty) {
      print('Email or password is empty.');
      return false;
    }

    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );

      final user = credential.user;

      if (user == null ) {
        print(user == null ? 'User does not exist' : 'User is not verified');
        return false;
      }

      print('User verified from Firebase');
      Global.storageService.setString(AppConstant.STORAGE_USER_TOKEN_KEY, user.uid);
      return true;

    } on FirebaseAuthException catch (e) {
      print('Authentication error: ${e.message}');
    } catch (e) {
      print('An unexpected error occurred: $e');
    }

    return false;
  }
}
