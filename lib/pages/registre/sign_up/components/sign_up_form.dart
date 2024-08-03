import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/components/default_button.dart';
import '../../../../common/components/form_error.dart';
import '../../../../constants.dart';
import '../../../../size_config.dart';
import '../../../sign_in/bloc/signin_states.dart';
import '../../SignUpController.dart';
import '../../bloc/registre_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  String? userName;
  String? email;
  String? password;
  String? rePassword;
  bool remember = false;
  final List<String?> errors = [];

  @override
  late final SignUpController _signUpController;
  @override
  void initState() {
    super.initState();
    _signUpController = SignUpController(context: context); // Initialize the controller
  }


  void addError({String? error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({String? error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        return Form(
          key: _formKey,
          child: Column(
            children: [
              buildUserName(context,state),
              SizedBox(height: getProportionateScreenHeight(30)),
              buildEmailFormField(context,state),
              SizedBox(height: getProportionateScreenHeight(30)),
              buildPasswordFormField(context,state),
              SizedBox(height: getProportionateScreenHeight(30)),
              buildConformPassFormField(context,state),
              FormError(MyListErrors: errors),
              SizedBox(height: getProportionateScreenHeight(40)),
              DefaultButton(
                text: "Continue",
                press: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // if all are valid then go to success screen
                    context.go("/CompleteProfileScreen");
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }

  TextFormField buildConformPassFormField(
      BuildContext context, RegisterState state) {
    return TextFormField(
        obscureText: true,
        initialValue: state.rePassword,
        onSaved: (newValue) {
          context.read<RegisterBloc>().add(rePasswordEvent(newValue!));
        },
        onChanged: (value) {
          if (value.isNotEmpty) {
            removeError(error: kPassNullError);
          } else if (value.isNotEmpty && password == rePassword) {
            removeError(error: kMatchPassError);
          }
          rePassword = value;
          context.read<RegisterBloc>().add(rePasswordEvent(value));



        },
        validator: (value) {
          if (value!.isEmpty) {
            addError(error: kPassNullError);
            return "";
          } else if ((password != value)) {
            addError(error: kMatchPassError);
            return "";
          }
          return null;
        },
        decoration: const InputDecoration(
          labelText: "Confirm Password",
          hintText: "Re-enter your password",
          // If  you are using latest version of flutter then lable text and hint text shown like this
          // if you r using flutter less then 1.20.* then maybe this is not working properly
          floatingLabelBehavior: FloatingLabelBehavior.always,
          icon: Icon(Icons.lock),
          suffixIcon: Icon(Icons.lock),
        ));
  }

  TextFormField buildPasswordFormField(BuildContext context, RegisterState state) {
    return TextFormField(
        obscureText: true,
        initialValue: state.password,
        onSaved: (newValue) {
          context.read<RegisterBloc>().add(passwordEvent(newValue!));
        },
        onChanged: (value) {
          if (value.isNotEmpty) {
            removeError(error: kPassNullError);
          } else if (value.isNotEmpty && password == password) {
            removeError(error: kMatchPassError);
          }
          rePassword = value;
          context.read<RegisterBloc>().add(passwordEvent(value));



        },
        validator: (value) {
          if (value!.isEmpty) {
            addError(error: kPassNullError);
            return "";
          } else if ((password != value)) {
            addError(error: kMatchPassError);
            return "";
          }
          return null;
        },
        decoration: const InputDecoration(
          labelText: "Confirm Password",
          hintText: "Re-enter your password",
          // If  you are using latest version of flutter then lable text and hint text shown like this
          // if you r using flutter less then 1.20.* then maybe this is not working properly
          floatingLabelBehavior: FloatingLabelBehavior.always,
          icon: Icon(Icons.lock),
          suffixIcon: Icon(Icons.lock),
        ));
  }

  TextFormField buildEmailFormField(BuildContext context, RegisterState state) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      initialValue: state.email,
      onSaved: (newValue) {
        context.read<RegisterBloc>().add(emailEvent(newValue!));
      },



      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
        context.read<RegisterBloc>().add(emailEvent(value));

      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Email",
        hintText: "Enter your email",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        icon: Icon(Icons.email),
      ),
    );
  }

  TextFormField buildUserName(BuildContext context, RegisterState state) {
    return TextFormField(
      keyboardType: TextInputType.name,
      initialValue: state.userName,
      onSaved: (newValue) {
        context.read<RegisterBloc>().add(userNameEvent(newValue!));
      },
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
        context.read<RegisterBloc>().add(userNameEvent(value));},
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "user Name",
        hintText: "Enter your user Name",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        icon: Icon(Icons.account_circle),
      ),
    );
  }
}
