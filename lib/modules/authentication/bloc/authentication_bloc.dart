import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  //------------------Variables and instances-----------------------------------------
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  //-----------------------------------------------------------------------------------
  AuthenticationBloc() : super(AuthenticationInitial()) {
    on<AuthenticationEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
