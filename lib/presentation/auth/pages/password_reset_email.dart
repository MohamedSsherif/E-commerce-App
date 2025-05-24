import 'package:ecommerce/common/helper/navigator/app_navigator.dart';
import 'package:ecommerce/common/widgets/button/basic_app_button.dart';
import 'package:ecommerce/core/configs/assets/app_vectors.dart';
import 'package:ecommerce/presentation/auth/pages/signin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class PasswordResetEmailPage extends StatelessWidget {
  const PasswordResetEmailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 30),
          _emailSending(),
          const SizedBox(height: 30),
          _sentEmail(),
          const SizedBox(height: 30),
          _returnToLoginButton(context),
          const SizedBox(height: 30),
        ]
          ),
 
      );
     

  }
}
  Widget _emailSending(){
    return Center(
      child: SvgPicture.asset(
        AppVectors.emailSending,
      ),
    );
  }

  Widget _sentEmail(){
    return
    Center(
      child: Text(
        'we sent you an email to reset your password.',
        
      ),
    );
  }
  Widget _returnToLoginButton(BuildContext context){
    return  BasicAppButton(
      onPressed: () {
        AppNavigator.push(
            context,
           SigninPage (),
            );
      },
      title: 'Return to Login',
      height: 50,
      width: 200,
    );
}