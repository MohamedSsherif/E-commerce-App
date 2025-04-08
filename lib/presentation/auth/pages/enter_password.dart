import 'package:ecommerce/presentation/auth/pages/forgot_password.dart';
import 'package:ecommerce/common/helper/navigator/app_navigator.dart';
import 'package:ecommerce/common/widgets/appbar/app_bar.dart';
import 'package:ecommerce/common/widgets/button/basic_app_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class EnterPasswordPage extends StatelessWidget {
  const EnterPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold( 
      appBar: const BasicAppbar(),
      body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _signinText(context),
          const SizedBox(height: 20),
          _passwordField(context),
          const SizedBox(height: 20),
          _button(context),
          SizedBox(height: 20),
          _forgotPassword(context),
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

  Widget _passwordField(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        hintText: 'Enter Password',
      ),
    );
  }

  Widget _button(BuildContext context) {
    return BasicAppButton(
      onPressed: () {},
      title: 'continue',
    );
  }

  Widget _forgotPassword(BuildContext context) {
    return RichText(
        text: TextSpan(
            text: 'Forgot Password? ',
            style: const TextStyle(color: Colors.white, fontSize: 16),
            children: [
          TextSpan(
              text: 'Reset',
              recognizer: TapGestureRecognizer()..onTap = () {
                 AppNavigator.push(context, const ForgotPasswordPage());
              },
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold))
        ]));
  }
}
  
