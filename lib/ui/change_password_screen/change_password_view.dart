import 'package:wishden/app/locator/locator.dart';
import 'package:wishden/app/shared/app_buttons.dart';
import 'package:wishden/app/shared/app_decoration.dart';
import 'package:wishden/app/shared/app_header.dart';
import 'package:wishden/app/shared/app_password_field.dart';
import 'package:wishden/helpers/constant/app_colors.dart';
import 'package:wishden/helpers/constant/app_string.dart';
import 'package:wishden/helpers/constant/ui_helper.dart';
import 'package:wishden/helpers/utils/form_validator.dart';
import 'package:wishden/navigation/route.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wishden/ui/change_password_screen/change_password_viewmodel.dart';
import 'package:stacked/stacked.dart';

class ChangepasswordScreenView extends StatefulWidget {
  const ChangepasswordScreenView({super.key});

  @override
  State<ChangepasswordScreenView> createState() =>
      _ChangepasswordScreenViewState();
}

class _ChangepasswordScreenViewState extends State<ChangepasswordScreenView>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ChangepasswordScreenViewModel>.reactive(
        viewModelBuilder: () => ChangepasswordScreenViewModel(),
        builder: (context, model, child) => Scaffold(
              backgroundColor: AppColors.backgroundColor,
              appBar: AppHeader(title: AppStrings.changePassword),
              body: SafeArea(
                child: Form(
                  key: model.formKey,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        gapMedium,
                        Text("Enter current password and set new password",
                            style: subHeaderTextStyle.copyWith(
                                fontWeight: FontWeight.w200)),
                        gapTiny,
                        gapMedium,
                        Expanded(
                          child: ListView(
                            children: [
                              const Text(
                                "Current password",
                                style: bodyTextStyle,
                              ),
                              gapTiny,
                              PasswordFormField(
                                controller: model.passwordController,
                                isObscure: model.isVisible3,
                                onTap: () => model.toggleVisibility3(),
                                hint: AppStrings.passwordPlaceholder,
                                validate: FormValidation.passwordValidation,
                              ),
                              gapMedium,
                              const Text(
                                AppStrings.newPassword,
                                style: bodyTextStyle,
                              ),
                              gapTiny,
                              PasswordFormField(
                                controller: model.passwordController,
                                isObscure: model.isVisible1,
                                onTap: () => model.toggleVisibility1(),
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
                                isObscure: model.isVisible2,
                                onTap: () => model.toggleVisibility2(),
                                hint: AppStrings.passwordPlaceholder,
                                validate: FormValidation.passwordValidation,
                              ),
                              gapMedium,
                              GestureDetector(
                                onTap: () {
                                  locator<GoRouter>()
                                      .push(AppRoutes.forgotPwrdView);
                                },
                                child: const Text(
                                  AppStrings.forgotPassword,
                                  style: bodyTextStyle,
                                ),
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
