import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pubmate_light/const/routes.dart';

import '../bloc/authentication_bloc.dart';

class AuthHandlerView extends StatelessWidget {
  const AuthHandlerView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state is CurrentUserExistsState) {
          Navigator.pushReplacementNamed(context, AppRoutes.home);
        } else {
          Navigator.pushReplacementNamed(context, AppRoutes.login);
        }
      },
      child: const Scaffold(body: SizedBox()),
    );
  }
}
