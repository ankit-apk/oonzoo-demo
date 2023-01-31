import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pubmate_light/const/resource.dart';
import 'package:pubmate_light/const/routes.dart';
import 'package:pubmate_light/modules/authentication/bloc/authentication_bloc.dart';
import 'package:pubmate_light/theme/colors.dart';
import 'package:pubmate_light/theme/textstyles.dart';
import 'package:pubmate_light/utils/ontap_extension.dart';
import 'package:pubmate_light/utils/sized_box.dart';
import 'package:pubmate_light/utils/unfocus.dart';
import 'package:sizer/sizer.dart';

import '../../../widgets/custom_textfield.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Unfocus(
      child: Scaffold(
        backgroundColor: AppColors.primary,
        body: Stack(
          children: [
            //--------------Background floating logo--------------
            Positioned(
              top: -300,
              bottom: 0,
              left: -500,
              right: -220,
              child: Opacity(
                opacity: 0.05,
                child: Image.asset(
                  R.ASSETS_IMAGES_IMAGES_PNG,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            //------------------------------------------------------
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Welcome back!",
                  style: AppTextStyles.headingLight,
                ),
                1.2.bh(),
                Text(
                  "Sign in to your account",
                  style: AppTextStyles.headingDark,
                ),
                3.5.bh(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account? ",
                      style: AppTextStyles.bodyLight,
                    ),
                    Text("Sign Up", style: AppTextStyles.linkText).onTap(
                        () => Navigator.pushNamed(context, AppRoutes.signup))
                  ],
                ),
                5.bh(),
                CustomTextField(
                  textEditingController:
                      context.read<AuthenticationBloc>().emailController,
                  label: "Email",
                  isPassword: false,
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                ),
                3.bh(),
                CustomTextField(
                  obscureText: true,
                  textEditingController:
                      context.read<AuthenticationBloc>().passwordController,
                  label: "Password",
                  isPassword: true,
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                ),
                7.bh(),
                Text(
                  "Forgot your password?",
                  style: AppTextStyles.linkText,
                ),
                7.bh(),
                const Divider(
                  thickness: 1.2,
                  color: AppColors.border,
                ),
                4.bh(),
                Text(
                  "SIGN IN",
                  style: AppTextStyles.linkTextBold,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
