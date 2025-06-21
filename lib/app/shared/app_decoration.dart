import 'package:wishden/helpers/constant/app_colors.dart';
import 'package:flutter/material.dart';

const tinyTextStyle = TextStyle(
  fontSize: 12,
  fontFamily: 'Lexend',
  color: AppColors.textColor,
  fontWeight: FontWeight.normal,
);

const bodyTextStyle = TextStyle(
  fontSize: 14,
  fontFamily: 'Lexend',
  color: AppColors.textColor,
  fontWeight: FontWeight.w300,
);

const headerTextStyle = TextStyle(
  fontFamily: 'Lexend',
  fontSize: 35,
  color: AppColors.normalBlack,
  fontWeight: FontWeight.bold,
);

const subHeaderTextStyle = TextStyle(
  fontFamily: 'Lexend',
  fontSize: 20,
  color: AppColors.normalBlack,
  fontWeight: FontWeight.w700,
);

InputDecoration kInputDecoration = const InputDecoration(
  isDense: true,
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(5),
    ),
    borderSide: BorderSide(
      color: AppColors.primary,
    ),
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(5),
    ),
    borderSide: BorderSide(
      color: AppColors.primary,
      width: 1.5,
    ),
  ),
  errorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(5)),
    borderSide: BorderSide(
      color: AppColors.errorColor,
      width: 1.5,
    ),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(5)),
    borderSide: BorderSide(
      color: AppColors.errorColor,
      width: 1.5,
    ),
  ),
);
