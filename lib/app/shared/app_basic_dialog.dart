// ignore_for_file: unused_element

import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:wishden/app/shared/app_buttons.dart';
import 'package:wishden/app/shared/app_decoration.dart';
import 'package:wishden/app/shared/app_input_text.dart';
import 'package:wishden/helpers/constant/app_colors.dart';
import 'package:wishden/helpers/constant/ui_helper.dart';
import 'package:wishden/models/app_model/app_dialog_request_model.dart';
import 'package:wishden/models/enums/emum.dart';
import 'package:flutter/material.dart';

class BasicDialog extends StatelessWidget {
  final DialogRequestModel request;
  final VoidCallback onMainTap;
  final VoidCallback onSecondaryTap;
  const BasicDialog(
      {super.key,
      required this.request,
      required this.onMainTap,
      required this.onSecondaryTap});

  @override
  Widget build(BuildContext context) {
    return Dialog(
        backgroundColor: Colors.transparent,
        child: _BasicDialogContent(
          request: request,
          onMainTap: onMainTap,
          onSecondaryTap: onSecondaryTap,
        ));
  }
}

class _BasicDialogContent extends StatelessWidget {
  const _BasicDialogContent({
    required this.request,
    required this.onMainTap,
    required this.onSecondaryTap,
  });

  final DialogRequestModel request;
  final VoidCallback onMainTap;
  final VoidCallback onSecondaryTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topCenter,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          padding: const EdgeInsets.only(
            top: 32,
            left: 16,
            right: 16,
            bottom: 12,
          ),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                request.title ?? '',
                textAlign: TextAlign.center,
                style:
                    subHeaderTextStyle.copyWith(color: AppColors.normalBlack),
              ),
              gapSmall,
              if (request.description != null)
                Text(
                  request.description ?? '',
                  textAlign: TextAlign.center,
                  style: bodyTextStyle.copyWith(color: AppColors.normalBlack),
                ),
              gapSmall,
              gapSmall,
              if (request.takesInput == true) ...[
                CustomInputText(
                    prefix: const Icon(Iconsax.edit_2_copy),
                    controller: request.controller,
                    inputType: TextInputType.text,
                    hint: request.inputText ?? ""),
                gapSmall,
                gapSmall,
              ],
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  if (request.secondaryButtonTitle != null)
                    PrimaryBtn(
                      height: 50,
                      color: AppColors.errorColor,
                      borderColor: AppColors.errorColor,
                      title: request.secondaryButtonTitle ?? '',
                      onPress: () => onSecondaryTap(),
                    ),
                  gapSmall,
                  PrimaryBtn(
                    height: 50,
                    textColor: request.mainColor != null
                        ? AppColors.white
                        : AppColors.normalBlack,
                    color: request.mainColor ?? AppColors.white,
                    borderColor: AppColors.white,
                    title: request.mainButtonTitle ?? '',
                    onPress: () => onMainTap(),
                  ),
                  gapSmall,
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Color _getStatusColor(dynamic customData) {
    if (customData is BasicDialogStatus) {
      switch (customData) {
        case BasicDialogStatus.error:
          return AppColors.errorColor;
        case BasicDialogStatus.warning:
          return AppColors.warningColor;
        default:
          return AppColors.primary;
      }
    } else {
      return AppColors.primary;
    }
  }
}
