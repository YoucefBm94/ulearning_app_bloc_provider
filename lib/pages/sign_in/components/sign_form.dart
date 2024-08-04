import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../common/components/default_button.dart';
import '../../../common/components/form_error.dart';
import '../../../common/value/constant.dart';
import '../../../constants.dart';
import '../../../global.dart';
import '../../../helper/keyboard.dart';
import '../../../size_config.dart';
import '../bloc/sign_in_blocs.dart';
import '../bloc/sign_in_events.dart';
import '../bloc/signin_states.dart';
import '../sigin_in_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignForm extends StatefulWidget {
  const SignForm({super.key});

  @override
  State<SignForm> createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;

  late final SignInController _signInController;



  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBlocs, SignInState>(
      builder: (context, state) {
        return Form(
          key: _formKey,
          child: Column(
            children: [
              buildEmailFormField((value) {
                context.read<SignInBlocs>().add(EmailEvent(value));
              }),
              SizedBox(height: getProportionateScreenHeight(30)),
              buildPasswordFormField((value) {
                context.read<SignInBlocs>().add(PasswordEvent(value));
              }),
              SizedBox(height: getProportionateScreenHeight(30)),
              Row(
                children: [
                  const Text("Remember me"),
                  const Spacer(),
                  GestureDetector(
                    onTap: () => context.go("/ForgotPasswordScreen"),
                    child: const Text(
                      "Forgot Password",
                      style: TextStyle(decoration: TextDecoration.underline),
                    ),
                  )
                ],
              ),
              SizedBox(height: getProportionateScreenHeight(20)),
              DefaultButton(
                text: "Continue",
                press: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    KeyboardUtil.hideKeyboard(context);
                    bool isSignedIn = await SignInController(context: context).handleSignIn("email");

                    if (isSignedIn) {
                      context.go("/Application_Page");
                    } else {
                      // Optionally, display an error message or handle the failure case
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Sign-in failed. Please check your credentials.')),
                      );
                    }
                  }
                },
              ),

            ],
          ),
        );
      },
    );
  }

  TextFormField buildEmailFormField(void Function(String value)? func) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) => func!(value),
      decoration: const InputDecoration(
        labelText: "Email",
        hintText: "Enter your email",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.mail),
      ),
    );
  }

  TextFormField buildPasswordFormField(void Function(String value)? func) {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) => func!(value),
      decoration: const InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.lock),
      ),
    );
  }
}
