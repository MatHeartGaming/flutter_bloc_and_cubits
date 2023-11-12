import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String? label;
  final String? hint;
  final String? errorMessage;
  final bool obscureText;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;

  const CustomTextFormField(
      {super.key, this.label, this.hint, this.onChanged, this.validator, this.errorMessage, this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(40),
    );
    return TextFormField(
      onChanged: onChanged,
      validator: validator,
      obscureText: obscureText,
      decoration: InputDecoration(
          enabledBorder: border,
          focusedBorder:
              border.copyWith(borderSide: BorderSide(color: colors.primary)),
          isDense: true,
          label: Text(label ?? ""),
          hintText: hint,
          prefixIcon: Icon(
            Icons.supervised_user_circle_outlined,
            color: colors.inversePrimary,
          ),
          focusColor: colors.primary,
          focusedErrorBorder:
              border.copyWith(borderSide: BorderSide(color: colors.error)),
          errorBorder:
              border.copyWith(borderSide: BorderSide(color: colors.error)),
          errorText: errorMessage),
    );
  }
}
