import 'package:ecommerce/presentation/auth/pages/enter_password.dart';
import 'package:ecommerce/presentation/auth/pages/signup.dart';
import 'package:ecommerce/common/helper/navigator/app_navigator.dart';
import 'package:ecommerce/common/widgets/appbar/app_bar.dart';
import 'package:ecommerce/common/widgets/button/basic_app_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SigninPage extends StatelessWidget {
  const SigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(hideBack: true,),
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _signinText(context),
          const SizedBox(height: 20),
          _emailField(context),
          const SizedBox(height: 20),
          _button(context),
          const SizedBox(height: 20),
          _createAccount(context),
        ],
      ),
    ));
  }

  Widget _signinText(BuildContext context) {
    return const Text(
      'Sign in',
      style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
    );
  }

  Widget _emailField(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        hintText: 'Enter Email',
      ),
    );
  }

  Widget _button(BuildContext context) {
    return BasicAppButton(
      onPressed: () {
         AppNavigator.push(context, const EnterPasswordPage());
      },
      title: 'continue',
    );
  }

  Widget _createAccount(BuildContext context) {
    return RichText(
        text:   TextSpan(
            text: 'Don\'t have an account? ',
            style: const TextStyle(color: Colors.white, fontSize: 16),
            children: [
          TextSpan(
              text: 'Create one',
              recognizer: TapGestureRecognizer()..onTap = () {
                  AppNavigator.push(context,  SignupPage());
              },
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold))
        ]));
  }
}
