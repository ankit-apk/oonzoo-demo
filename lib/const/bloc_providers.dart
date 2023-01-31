import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pubmate_light/modules/authentication/bloc/authentication_bloc.dart';
import 'package:pubmate_light/modules/authentication/views/sign_in.dart';

class AppBlocProviders {
  const AppBlocProviders._();

//---------------------------------------------------------------
  static final _authBloc = BlocProvider<AuthenticationBloc>(
    create: (BuildContext context) => AuthenticationBloc(),
    child: const LoginScreen(),
  );
//---------------------------------------------------------------
  static List<BlocProvider> get appBlocs => [_authBloc];
}
