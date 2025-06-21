// ignore_for_file: deprecated_member_use

import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:wishden/app/locator/locator.dart';
import 'package:wishden/app/shared/app_buttons.dart';
import 'package:wishden/app/shared/app_decoration.dart';
import 'package:wishden/app/shared/app_header.dart';
import 'package:wishden/app/shared/app_input_text.dart';
import 'package:wishden/app/styels/ui_helper.dart';
import 'package:wishden/helpers/constant/app_colors.dart';
import 'package:wishden/helpers/constant/app_string.dart';
import 'package:wishden/helpers/constant/ui_helper.dart';
import 'package:wishden/navigation/route.dart';
import 'package:wishden/ui/edit_profile_screen/edit_profile_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stacked/stacked.dart';

class EditProfileScreenView extends StatefulWidget {
  const EditProfileScreenView({super.key});

  @override
  State<EditProfileScreenView> createState() => _EditProfileScreenViewState();
}

class _EditProfileScreenViewState extends State<EditProfileScreenView>
    with SingleTickerProviderStateMixin {
  @override
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<EditProfileScreenViewModel>.reactive(
        viewModelBuilder: () => EditProfileScreenViewModel(),
        builder: (context, model, child) {
          return Scaffold(
            backgroundColor: AppColors.backgroundColor,
            appBar: AppHeader(title: 'Edit profile'),
            body: SingleChildScrollView(
              child: SafeArea(
                child: Form(
                  key: model.formKey,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: SizedBox(
                      height: screenHeight(context, 1.1),
                      child: ListView(
                        children: [
                          gapMedium,
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundColor:
                                    AppColors.blueColor.withOpacity(0.1),
                                radius: 45,
                                child: const Center(
                                  child: Icon(
                                    Iconsax.camera_copy,
                                    color: AppColors.primary,
                                  ),
                                ),
                              ),
                              horizontalSpaceSmall,
                              PrimaryBtn(
                                title: "Change Profile Picture",
                                onPress: () {},
                                borderColor: AppColors.backgroundColor,
                                color: const Color.fromARGB(255, 213, 248, 215),
                                textColor: AppColors.successColor,
                                width: 180,
                                height: 40,
                              )
                            ],
                          ),
                          gapMedium,
                          const Text(
                            AppStrings.firstName,
                            style: bodyTextStyle,
                          ),
                          gapSmall,
                          const CustomInputText(
                            hint: AppStrings.textHere,
                            inputType: TextInputType.text,
                          ),
                          gapMedium,
                          const Text(
                            AppStrings.lastName,
                            style: bodyTextStyle,
                          ),
                          gapSmall,
                          const CustomInputText(
                            hint: AppStrings.textHere,
                            inputType: TextInputType.text,
                          ),
                          gapMedium,
                          const Text(
                            AppStrings.email,
                            style: bodyTextStyle,
                          ),
                          gapSmall,
                          const CustomInputText(
                            hint: AppStrings.textHere,
                            inputType: TextInputType.text,
                          ),
                          gapSmall,
                          const Text(
                            AppStrings.phoneNumber,
                            style: bodyTextStyle,
                          ),
                          gapSmall,
                          const CustomInputText(
                            hint: AppStrings.textHere,
                            inputType: TextInputType.text,
                          ),
                          gapMedium,
                          const Text(
                            "Location",
                            style: bodyTextStyle,
                          ),
                          gapSmall,
                          const CustomInputText(
                            hint: AppStrings.textHere,
                            inputType: TextInputType.text,
                            suffix: Icon(Iconsax.location_copy),
                          ),
                          gapMedium,
                          PrimaryBtn(
                            title: AppStrings.continueTxt,
                            onPress: () {
                              locator<GoRouter>().push(
                                AppRoutes.permissionView,
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
