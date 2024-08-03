import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../common/components/default_button.dart';
import '../../../common/components/form_error.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import '../bloc/sign_in_blocs.dart';
import '../bloc/signin_states.dart';
import '../sigin_in_controller.dart';

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
  void initState() {
    super.initState();
    _signInController = SignInController(context: context);
  }





  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBlocs, SignInState>(
      builder: (context, state) {
        return Form(
          key: _formKey,
          child: Column(
            children: [
              buildEmailFormField(context, state),
              SizedBox(height: getProportionateScreenHeight(30)),
              buildPasswordFormField(context, state),
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
                    await _signInController.handeleSignIn("email");
                    context.go("/Home_Screen");
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }

  TextFormField buildEmailFormField(BuildContext context, SignInState state) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      decoration: const InputDecoration(
        labelText: "Email",
        hintText: "Enter your email",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.mail),
      ),
    );
  }

  TextFormField buildPasswordFormField(BuildContext context, SignInState state) {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      decoration: const InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.lock),
      ),
    );
  }
}
