import 'package:flutter/material.dart';
import 'package:pubmate_light/modules/authentication/views/sign_in.dart';
import 'package:pubmate_light/modules/authentication/views/sign_up.dart';

import '../modules/home_page/views/home_page.dart';

class AppRoutes {
  const AppRoutes._();

  //-----------------Addresses--------------
  static const String login = "/";
  static const String signup = "/signup";
  static const String home = "/home";

  //-------------Route Map------------------

  //----------------------------------------------------------------------------
  static Map<String, Widget Function(BuildContext)> get appRoutes => {
        login: (context) => const LoginScreen(),
        signup: (context) => const SignupScreen(),
        home: (context) => const HomePageScreen(),
      };
}
