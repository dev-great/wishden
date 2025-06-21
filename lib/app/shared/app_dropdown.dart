import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:wishden/app/shared/app_decoration.dart';
import 'package:wishden/helpers/constant/app_colors.dart';

Widget buildDropdown(
  String hint,
  String? value,
  String? type,
  List<String> options,
  void Function(String?) onChanged,
) {
  return Container(
    height: 60,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: AppColors.white,
      border: Border.all(color: AppColors.white),
    ),
    padding: const EdgeInsets.all(12),
    child: DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        isExpanded: true,
        value: value,
        hint: Text(hint, style: bodyTextStyle),
        icon: const Icon(Iconsax.arrow_down_1_copy),
        onChanged: onChanged,
        items: options.map((String val) {
          return DropdownMenuItem(
            value: val,
            child: Text("$val - $type", style: bodyTextStyle),
          );
        }).toList(),
      ),
    ),
  );
}
