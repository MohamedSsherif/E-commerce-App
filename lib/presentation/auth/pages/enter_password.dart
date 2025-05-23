import 'package:ecommerce/common/bloc/button/button_state.dart';
import 'package:ecommerce/common/bloc/button/button_state_cubit.dart';
import 'package:ecommerce/common/widgets/button/basic_reactive_button.dart';
import 'package:ecommerce/data/auth/models/user_signin_req.dart';
import 'package:ecommerce/domain/auth/usecase/signin.dart';
import 'package:ecommerce/presentation/auth/pages/forgot_password.dart';
import 'package:ecommerce/common/helper/navigator/app_navigator.dart';
import 'package:ecommerce/common/widgets/appbar/app_bar.dart';
import 'package:ecommerce/common/widgets/button/basic_app_button.dart';
import 'package:ecommerce/presentation/home/pages/home.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EnterPasswordPage extends StatelessWidget {
  final UserSigninReq signinReq;
  EnterPasswordPage({super.key, required this.signinReq});

  final TextEditingController _passwordCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const BasicAppbar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
          child: BlocProvider(
            create: (context) => ButtonStateCubit(),
            child: BlocListener<ButtonStateCubit, ButtonState>(
              listener: (context, state) {
                if (state is ButtonFailureState) {
                  var snackbar = SnackBar(
                    content: Text(state.errorMessage),
                    behavior: SnackBarBehavior.floating,
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackbar);
                } else if (state is ButtonSuccessState) {
                  AppNavigator.pushAndRemove(context, const HomePage());
                } else if (state is ButtonLoadingState) {
                  var snackbar = const SnackBar(
                    content: Text("loading"),
                    behavior: SnackBarBehavior.floating,
                    duration: Duration(seconds: 1),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackbar);
                }
              },
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
            ),
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
      controller: _passwordCon,
      decoration: const InputDecoration(
        hintText: 'Enter Password',
      ),
    );
  }

  Widget _button(BuildContext context) {
    return Builder(builder: (context) {
      return BasicReactiveButton(
        onPressed: () {
          signinReq.password = _passwordCon.text;
          context.read<ButtonStateCubit>().execute(
                usecase: SigninUseCase(),
                params: signinReq,
              );
        },
        title: 'continue',
      );
    });
  }

  Widget _forgotPassword(BuildContext context) {
    return RichText(
        text: TextSpan(
            text: 'Forgot Password? ',
            style: const TextStyle(color: Colors.white, fontSize: 16),
            children: [
          TextSpan(
              text: 'Reset',
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  AppNavigator.push(context, ForgotPasswordPage());
                },
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold))
        ]));
  }
}
