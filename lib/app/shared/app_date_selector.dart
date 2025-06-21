import 'package:flutter/material.dart';
import 'package:wishden/app/shared/app_decoration.dart';
import 'package:wishden/helpers/constant/app_colors.dart';

class CustomDateRangeFormField extends StatefulWidget {
  const CustomDateRangeFormField({
    super.key,
    this.bcolor,
    required this.value,
    this.hint,
    this.onDateSelected,
    this.prefixIcon,
    this.width,
    this.boderRaduis,
    this.validate,
  });

  final Color? bcolor;
  final Widget? prefixIcon;
  final double? width;
  final double? boderRaduis;
  final TextEditingController value;
  final String? hint;
  final String? Function(String?)? validate;
  final VoidCallback? onDateSelected;

  @override
  State<CustomDateRangeFormField> createState() =>
      _CustomDateRangeFormFieldState();
}

class _CustomDateRangeFormFieldState extends State<CustomDateRangeFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: true,
      controller: widget.value,
      onChanged: (_) {},
      onTap: () {
        widget.onDateSelected?.call();
      },
      style: bodyTextStyle,
      validator: widget.validate,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(18),
        hintText: widget.hint,
        fillColor: widget.bcolor ?? AppColors.white,
        filled: true,
        hintStyle: bodyTextStyle,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: widget.bcolor ?? AppColors.white,
          ),
          borderRadius: BorderRadius.circular(widget.boderRaduis ?? 25),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.backgroundColor.withOpacity(0.3),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(widget.boderRaduis ?? 25),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.white,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(widget.boderRaduis ?? 25),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.white,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(25),
        ),
        prefixIcon: widget.prefixIcon,
      ),
    );
  }
}
