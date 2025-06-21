import 'package:wishden/app/shared/app_decoration.dart';
import 'package:wishden/helpers/constant/app_colors.dart';
import 'package:flutter/material.dart';

class CustomInputTextWithBoarder extends StatefulWidget {
  const CustomInputTextWithBoarder({
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
    this.borderColor,
    this.onTap,
    this.onChange,
    this.validate,
  });
  final Widget? prefix;
  final Widget? suffix;
  final Color? color;
  final Color? borderColor;
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
  State<CustomInputTextWithBoarder> createState() =>
      _CustomInputTextWithBoarderState();
}

class _CustomInputTextWithBoarderState
    extends State<CustomInputTextWithBoarder> {
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
        contentPadding: const EdgeInsets.all(15),
        prefixIcon: widget.prefix,
        suffixIcon: widget.suffix,
        fillColor: widget.color ?? AppColors.backgroundColor.withOpacity(0.3),
        filled: true,
        hintText: widget.hint,
        hintStyle: bodyTextStyle.copyWith(color: AppColors.grayColor),
        isDense: true,
        errorText: widget.errorText,
        floatingLabelBehavior: widget.floating
            ? FloatingLabelBehavior.always
            : FloatingLabelBehavior.auto,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: widget.borderColor ??
                AppColors.backgroundColor.withOpacity(0.3),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: widget.borderColor ??
                AppColors.backgroundColor.withOpacity(0.3),
            width: 1,
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.errorColor,
            width: 1,
          ),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.errorColor,
            width: 1,
          ),
        ),
      ),
    );
  }
}
