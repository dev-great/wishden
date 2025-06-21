import 'package:wishden/helpers/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

const Widget horizontalSpaceTiny = Gap(5);
const Widget horizontalSpaceSmall = Gap(10);
const Widget horizontalSpaceMedium = Gap(25);

const Widget gapTiny = Gap(5);
const Widget gapSmall = Gap(10);
const Widget gapMedium = Gap(25);
const Widget gapLarge = Gap(50);
const Widget gapMassive = Gap(120);

Widget spacedDivider = const Column(
  children: [
    Divider(
      color: AppColors.grayColor,
      height: 1,
    ),
  ],
);
