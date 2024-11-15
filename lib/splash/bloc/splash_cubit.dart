import 'package:ecommerce/splash/bloc/splash_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super( DisplaySplash());

  void appStarted() async{
  await  Future.delayed(const Duration(seconds: 3),(){
      emit(UnAuthenticated());
    });
  }
}