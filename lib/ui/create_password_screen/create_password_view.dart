import 'package:wishden/app/shared/app_header.dart';
import 'package:wishden/helpers/constant/app_string.dart';
import 'package:wishden/navigation/route.dart';
import 'package:wishden/app/locator/locator.dart';
import 'package:wishden/app/shared/app_buttons.dart';
import 'package:wishden/app/shared/app_decoration.dart';
import 'package:wishden/app/shared/app_password_field.dart';
import 'package:wishden/helpers/constant/app_colors.dart';
import 'package:wishden/helpers/constant/ui_helper.dart';
import 'package:wishden/helpers/utils/form_validator.dart';
import 'package:wishden/ui/create_password_screen/create_password_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:stacked/stacked.dart';

class CreatePasswordView extends StatefulWidget {
  final String otp;
  const CreatePasswordView({super.key, required this.otp});

  @override
  State<CreatePasswordView> createState() => _CreatePasswordViewState();
}

class _CreatePasswordViewState extends State<CreatePasswordView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CreatePasswordViewModel>.reactive(
        viewModelBuilder: () => CreatePasswordViewModel(),
        onViewModelReady: (model) {
          model.otp = widget.otp;
        },
        builder: (context, model, child) => Scaffold(
              backgroundColor: AppColors.backgroundColor,
              appBar: AppHeader(title: AppStrings.forgotPassword),
              body: SafeArea(
                child: Form(
                  key: model.formKey,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        gapMedium,
                        Text(AppStrings.createANewAndStrongPassword,
                            style: subHeaderTextStyle.copyWith(
                                fontWeight: FontWeight.w200)),
                        gapTiny,
                        gapMedium,
                        Expanded(
                          child: ListView(
                            children: [
                              const Text(
                                AppStrings.newPassword,
                                style: bodyTextStyle,
                              ),
                              gapTiny,
                              PasswordFormField(
                                controller: model.passwordController,
                                isObscure: model.isVisible,
                                onTap: () => model.toggleVisibility(),
                                hint: AppStrings.passwordPlaceholder,
                                validate: FormValidation.passwordValidation,
                              ),
                              gapMedium,
                              const Text(
                                AppStrings.confirmPassword,
                                style: bodyTextStyle,
                              ),
                              gapTiny,
                              PasswordFormField(
                                controller: model.confirmPasswordController,
                                isObscure: model.isVisible,
                                onTap: () => model.toggleVisibility(),
                                hint: AppStrings.passwordPlaceholder,
                                validate: FormValidation.passwordValidation,
                              ),
                              gapMedium,
                              Wrap(
                                direction: Axis
                                    .horizontal, // Ensures items are laid out in a row
                                spacing:
                                    8.0, // Space between each item in the row
                                children: List.generate(
                                    model.validationRules.length, (index) {
                                  return Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Iconsax.tick_circle,
                                        color: model.validationStatus[index]
                                            ? AppColors.successColor
                                            : AppColors.grayColor,
                                      ),
                                      horizontalSpaceSmall,
                                      Text(
                                        model.validationRules[index],
                                        style: bodyTextStyle,
                                      ),
                                    ],
                                  );
                                }),
                              ),
                              gapMedium,
                              PrimaryBtn(
                                  title: AppStrings.save,
                                  isLoading: model.isBusy,
                                  onPress: () async {
                                    locator<GoRouter>().push(
                                      AppRoutes.checkEmailView,
                                    );
                                  }),
                              gapLarge,
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ));
  }
}
