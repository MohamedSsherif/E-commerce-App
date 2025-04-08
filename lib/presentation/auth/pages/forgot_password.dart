import 'package:ecommerce/presentation/auth/pages/enter_password.dart';
import 'package:ecommerce/common/helper/navigator/app_navigator.dart';
import 'package:ecommerce/common/widgets/appbar/app_bar.dart';
import 'package:ecommerce/common/widgets/button/basic_app_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(),
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
         
        ],
      ),
    ));
  }

  Widget _signinText(BuildContext context) {
    return const Text(
      'Forgot Password',
      style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
    );
  }

  Widget _emailField(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        hintText: 'Enter Email Address',
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

}
