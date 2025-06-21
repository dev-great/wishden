import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:wishden/app/shared/app_decoration.dart';
import 'package:wishden/helpers/constant/app_colors.dart';
import 'package:wishden/helpers/utils/form_validator.dart';
import 'package:flutter/material.dart';

class PasswordFormField extends StatefulWidget {
  const PasswordFormField(
      {super.key,
      this.hint,
      required this.controller,
      required this.isObscure,
      this.errorText,
      this.onTap,
      this.onChange,
      this.validate,
      this.textInputType,
      this.readOnly = false,
      this.floating = false,
      this.max});
  final String? hint;
  final TextEditingController controller;
  final bool isObscure;
  final String? errorText;
  final VoidCallback? onTap;
  final Function(String?)? onChange;
  final String? Function(String?)? validate;
  final TextInputType? textInputType;
  final bool readOnly;
  final bool floating;
  final int? max;
  @override
  State<PasswordFormField> createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.isObscure,
      keyboardType: TextInputType.visiblePassword,
      validator: FormValidation.passwordValidation,
      maxLines: 1,
      onChanged: widget.onChange,
      style: bodyTextStyle,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(15),
          hintText: widget.hint,
          hintStyle: bodyTextStyle,
          fillColor: AppColors.white,
          filled: true,
          errorText: widget.errorText,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: const BorderSide(
              color: AppColors.primary,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: const BorderSide(
              color: AppColors.white,
              width: 1,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: const BorderSide(
              color: AppColors.errorColor,
              width: 1,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: const BorderSide(
              color: AppColors.errorColor,
              width: 1,
            ),
          ),
          suffixIcon: IconButton(
            onPressed: widget.onTap,
            icon: Icon(
              widget.isObscure ? Iconsax.eye_slash_copy : Iconsax.eye_copy,
              color: AppColors.textColor,
            ),
          )),
    );
  }
}
