// BLoC

import 'dart:async';
import 'package:bbd_frontend/bloc/signup_bloc/signup_event.dart';
import 'package:bbd_frontend/bloc/signup_bloc/signup_state.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupInitialState());
 
  @override
  Stream<SignupState> mapEventToState(SignupEvent event) async* {
    if (event is SubmitButton) {
      yield SignupLoadingState();
      try {
        // final UserModel user = await _authenticationService.signUp(
        //   email: event.email,
        //   password: event.password,
        // );
        yield SignupSuccessState();
      } catch (error) {
        yield SignupFailureState(error: error.toString());
      }
    }
  }
}
