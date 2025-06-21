import 'package:wishden/app/shared/app_decoration.dart';
import 'package:wishden/helpers/constant/app_colors.dart';
import 'package:flutter/material.dart';

class CustomInputText extends StatefulWidget {
  const CustomInputText({
    super.key,
    required this.inputType,
    this.textColor,
    this.color,
    this.prefix,
    required this.hint,
    this.onChangeVal,
    this.suffix,
    this.obscure,
    this.controller,
    this.maxLength,
    this.readOnly = false,
    this.floating = false,
    this.max,
    this.errorText,
    this.onTap,
    this.onChange,
    this.validate,
  });
  final Widget? prefix;
  final Widget? suffix;
  final Color? color;
  final Color? textColor;
  final String hint;
  final bool? obscure;
  final String? onChangeVal;
  final TextInputType inputType;
  final bool readOnly;
  final bool floating;
  final int? max;
  final String? errorText;
  final VoidCallback? onTap;
  final Function(String?)? onChange;
  final String? Function(String?)? validate;
  final int? maxLength;
  final TextEditingController? controller;

  @override
  State<CustomInputText> createState() => _CustomInputTextState();
}

class _CustomInputTextState extends State<CustomInputText> {
  late TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _textEditingController = widget.controller ?? TextEditingController();
    if (widget.controller != null && widget.onChangeVal != null) {
      _textEditingController.text = widget.onChangeVal!;
    }
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _textEditingController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _textEditingController,
      style: bodyTextStyle,
      keyboardType: widget.inputType,
      obscureText: widget.obscure ?? false,
      textInputAction: TextInputAction.next,
      onChanged: widget.onChange,
      maxLength: widget.maxLength,
      readOnly: widget.readOnly,
      validator: widget.validate,
      maxLines: widget.max,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(18),
        prefixIcon: widget.prefix,
        suffixIcon: widget.suffix,
        fillColor: AppColors.white,
        filled: true,
        hintText: widget.hint,
        hintStyle: bodyTextStyle.copyWith(color: AppColors.grayColor),
        isDense: true,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(
            color: AppColors.grayColor.withOpacity(0.2),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(
            color: AppColors.white,
            width: 1,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(
            color: AppColors.errorColor,
            width: 1,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(
            color: AppColors.errorColor,
            width: 1,
          ),
        ),
      ),
    );
  }
}
