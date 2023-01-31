// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../theme/colors.dart';
import '../theme/textstyles.dart';

class CustomTextField extends StatefulWidget {
  CustomTextField({
    super.key,
    this.obscureText = false,
    required this.textEditingController,
    required this.label,
    this.isPassword = false,
  });

  bool obscureText;
  final TextEditingController textEditingController;
  final String label;
  final bool isPassword;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: widget.obscureText,
      controller: widget.textEditingController,
      decoration: InputDecoration(
        labelText: widget.label,
        labelStyle: AppTextStyles.textfieldHeader,
        border: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.border),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.border),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.border),
        ),
        suffix: widget.isPassword
            ? IconButton(
                onPressed: () {
                  /*
                  Calling set state locally to prevent
                  whole widget tree from rebuilding.
                  */
                  setState(() {
                    widget.obscureText = !widget.obscureText;
                  });
                },
                icon: widget.obscureText
                    ? const Icon(Icons.remove_red_eye_outlined)
                    : const Icon(Icons.remove_red_eye),
              )
            : const SizedBox(),
      ),
    );
  }
}
