import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pubmate_light/const/resource.dart';
import 'package:pubmate_light/const/routes.dart';
import 'package:pubmate_light/modules/authentication/bloc/authentication_bloc.dart';
import 'package:pubmate_light/theme/colors.dart';
import 'package:pubmate_light/theme/textstyles.dart';
import 'package:pubmate_light/utils/ontap_extension.dart';
import 'package:pubmate_light/utils/sized_box.dart';
import 'package:pubmate_light/utils/text_to_snack.dart';
import 'package:pubmate_light/utils/unfocus.dart';
import 'package:sizer/sizer.dart';

import '../../../const/app_enums.dart';
import '../../../widgets/custom_textfield.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Unfocus(
      child: Scaffold(
        backgroundColor: AppColors.primary,
        body: BlocListener<AuthenticationBloc, AuthenticationState>(
          listener: (context, state) {
            if (state is SignupFailedState) {
              if (state.error == AuthErrors.invalidEmail) {
                "Enter a valid Email".textToSnack(context);
              } else if (state.error == AuthErrors.invalidPassword) {
                "Please enter your password".textToSnack(context);
              } else if (state.error == AuthErrors.invalidFirstName) {
                "Please enter your first name".textToSnack(context);
              } else if (state.error == AuthErrors.invalidLastName) {
                "Please enter your last name".textToSnack(context);
              } else {
                state.error.toString().textToSnack(context);
              }
            } else if (state is SignupSuccessState) {
              Navigator.pushReplacementNamed(context, AppRoutes.home);
            }
          },
          child: Stack(
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
                    "Create an account",
                    style: AppTextStyles.headingDark,
                  ),
                  3.5.bh(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account? ",
                        style: AppTextStyles.bodyLight,
                      ),
                      Text(
                        "Sign In",
                        style: AppTextStyles.linkText,
                      ).onTap(() => Navigator.pop(context))
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
                  3.bh(),
                  CustomTextField(
                    textEditingController:
                        context.read<AuthenticationBloc>().firstNameController,
                    label: "First Name",
                    padding: EdgeInsets.symmetric(horizontal: 4.w),
                  ),
                  3.bh(),
                  CustomTextField(
                    textEditingController:
                        context.read<AuthenticationBloc>().lastNameController,
                    label: "Last Name",
                    padding: EdgeInsets.symmetric(horizontal: 4.w),
                  ),
                  12.bh(),
                  const Divider(
                    thickness: 1.2,
                    color: AppColors.border,
                  ),
                  4.bh(),
                  BlocBuilder<AuthenticationBloc, AuthenticationState>(
                    builder: (context, state) {
                      if (state is AuthOperationInProgress) {
                        return Text(
                          "CREATING...",
                          style: AppTextStyles.linkTextBold,
                        );
                      } else {
                        return Text(
                          "CREATE AN ACCOUNT",
                          style: AppTextStyles.linkTextBold,
                        ).onTap(() => context
                            .read<AuthenticationBloc>()
                            .add(StartSignupEvent()));
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
