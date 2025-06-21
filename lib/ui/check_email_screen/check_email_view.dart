import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wishden/app/locator/locator.dart';
import 'package:wishden/app/shared/app_buttons.dart';
import 'package:wishden/app/shared/app_decoration.dart';
import 'package:wishden/app/shared/app_header.dart';
import 'package:wishden/app/shared/app_input_text.dart';
import 'package:wishden/app/shared/app_password_field.dart';
import 'package:wishden/helpers/constant/app_colors.dart';
import 'package:wishden/helpers/constant/app_string.dart';
import 'package:wishden/helpers/constant/ui_helper.dart';
import 'package:wishden/helpers/utils/form_validator.dart';
import 'package:wishden/navigation/route.dart';
import 'package:wishden/ui/check_email_screen/check_email_viewmodel.dart';
import 'package:stacked/stacked.dart';

class CheckEmailView extends StatefulWidget {
  const CheckEmailView({super.key});

  @override
  State<CheckEmailView> createState() => _CheckEmailViewState();
}

class _CheckEmailViewState extends State<CheckEmailView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CheckEmailViewModel>.reactive(
      viewModelBuilder: () => CheckEmailViewModel(),
      onViewModelReady: (viewModel) {},
      builder: (context, model, child) => Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: AppHeader(title: ''),
        body: Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              gapMedium,
              const Text(
                AppStrings.welcomeToWishden,
                style: subHeaderTextStyle,
              ),
              gapMedium,
              const Text(
                AppStrings.emailAddress,
                style: bodyTextStyle,
              ),
              gapSmall,
              const CustomInputText(
                hint: AppStrings.emailPlaceholder,
                inputType: TextInputType.emailAddress,
              ),
              if (model.isUser) ...[
                gapMedium,
                const Text(
                  AppStrings.password,
                  style: bodyTextStyle,
                ),
                gapSmall,
                PasswordFormField(
                  controller: model.passwordController,
                  isObscure: model.isVisible,
                  onTap: () => model.toggleVisibility(),
                  hint: "* * * * * *",
                  validate: FormValidation.passwordValidation,
                ),
                gapMedium,
                GestureDetector(
                  onTap: () {
                    locator<GoRouter>().push(AppRoutes.forgotPwrdView);
                  },
                  child: const Text(
                    AppStrings.forgotPassword,
                    style: bodyTextStyle,
                  ),
                ),
              ],
              gapMedium,
              gapSmall,
              PrimaryBtn(
                title: model.isUser ? AppStrings.logIn : AppStrings.continueTxt,
                onPress: () {
                  model.toogleisUser(!model.isUser);
                },
              ),
              if (model.isUser) ...[
                gapMedium,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          const TextSpan(
                              text: AppStrings.dontHaveAnAccount,
                              style: bodyTextStyle),
                          TextSpan(
                            text: AppStrings.signUp,
                            style: bodyTextStyle.copyWith(
                              color: AppColors.primary,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                locator<GoRouter>().push(
                                  AppRoutes.registerView,
                                );
                              },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                gapMedium,
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: AppStrings.bySigingUpYou,
                          style: bodyTextStyle.copyWith(
                            color: AppColors.grayColor,
                          )),
                      TextSpan(
                        text: AppStrings.termsOfService,
                        style: bodyTextStyle.copyWith(
                          decoration: TextDecoration.underline,
                          color: AppColors.grayColor,
                          fontWeight: FontWeight.w600,
                        ),
                        recognizer: TapGestureRecognizer()..onTap = () {},
                      ),
                      TextSpan(
                          text: AppStrings.and,
                          style: bodyTextStyle.copyWith(
                            color: AppColors.grayColor,
                          )),
                      TextSpan(
                        text: AppStrings.privacyPolicy,
                        style: bodyTextStyle.copyWith(
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.w600,
                          color: AppColors.grayColor,
                        ),
                        recognizer: TapGestureRecognizer()..onTap = () {},
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
