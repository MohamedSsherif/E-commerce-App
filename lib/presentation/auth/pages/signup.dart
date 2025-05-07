import 'package:ecommerce/data/auth/models/user_creation_req.dart';
import 'package:ecommerce/presentation/auth/pages/enter_password.dart';
import 'package:ecommerce/presentation/auth/pages/gender_and_age_selection.dart';
import 'package:ecommerce/presentation/auth/pages/signin.dart';
import 'package:ecommerce/common/helper/navigator/app_navigator.dart';
import 'package:ecommerce/common/widgets/appbar/app_bar.dart';
import 'package:ecommerce/common/widgets/button/basic_app_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatelessWidget {
   SignupPage({super.key});

  final TextEditingController _firstNameCon = TextEditingController();
  final TextEditingController _lastNameCon = TextEditingController();
  final TextEditingController _emailCon = TextEditingController();
  final TextEditingController _passwordCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(),
        body: SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
               _signinText(context),
              const SizedBox(height: 20),
                _firstNameField(context),
              const SizedBox(height: 20),
                _lastNameField(context),
              const SizedBox(height: 20),
               _emailField(context),
              const SizedBox(height: 20),
                _passwordField(context),
              const SizedBox(height: 20),
               _continueButton(context),
              const SizedBox(height: 20),
               _createAccount(context)
          ],
        ),
      ),
    ));
  }

  Widget _signinText(BuildContext context) {
    return const Text(
      'Create Account',
      style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
    );
  }

   Widget _firstNameField(BuildContext context) {
    return  TextField( 
      controller:_firstNameCon,
      decoration: InputDecoration(
        hintText: 'firstname'
      ),
    );
  }
    Widget _lastNameField(BuildContext context) {
    return  TextField( 
      controller: _lastNameCon,
      decoration: InputDecoration(
        hintText: 'Lastname'
      ),
    );
  }
   Widget _emailField(BuildContext context) {
    return  TextField( 
      controller: _emailCon,
      decoration: InputDecoration(
        hintText: 'Email Address'
      ),
    );
  }
    Widget _passwordField(BuildContext context) {
    return  TextField(
      controller: _passwordCon,
      decoration: InputDecoration(
        hintText: 'password'
      ),
    );
  }

  Widget _continueButton(BuildContext context) {
    return BasicAppButton(
      onPressed: () {
        AppNavigator.push(
          context,
          GenderAndAgeSelectionPage(
           userCreationReq: UserCreationReq(
            firstname: _firstNameCon.text,
            lastname: _lastNameCon.text,
            email: _emailCon.text,
            password: _passwordCon.text
            ),
        ));
      },
      title: 'Continue',
    );
  }

  Widget _createAccount(BuildContext context) {
    return RichText(
        text:   TextSpan(
            text: 'Do you have an account? ',
            style: const TextStyle(color: Colors.white, fontSize: 16),
            children: [
          TextSpan(
              text: 'sign in',
              recognizer: TapGestureRecognizer()..onTap = () {
                 AppNavigator.pushReplacement(context,  SigninPage());
              },
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold))
        ]));
  }
}
