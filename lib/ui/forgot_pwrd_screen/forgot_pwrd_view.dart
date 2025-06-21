import 'package:wishden/app/shared/app_header.dart';
import 'package:wishden/helpers/constant/app_string.dart';
import 'package:wishden/navigation/route.dart';
import 'package:wishden/app/locator/locator.dart';
import 'package:wishden/app/shared/app_buttons.dart';
import 'package:wishden/app/shared/app_decoration.dart';
import 'package:wishden/app/shared/app_input_text.dart';
import 'package:wishden/helpers/constant/app_colors.dart';
import 'package:wishden/helpers/constant/ui_helper.dart';
import 'package:wishden/helpers/utils/form_validator.dart';
import 'package:wishden/ui/forgot_pwrd_screen/forgot_pwrd_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stacked/stacked.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ForgotPasswordViewModel>.reactive(
        viewModelBuilder: () => ForgotPasswordViewModel(),
        builder: (context, model, child) => Scaffold(
              backgroundColor: AppColors.backgroundColor,
              appBar: AppHeader(title: ''),
              body: SafeArea(
                child: Form(
                  key: model.formKey,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 24, right: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        gapMedium,
                        const Text(
                          AppStrings.forgotPassword,
                          style: subHeaderTextStyle,
                        ),
                        gapMedium,
                        Text(
                          AppStrings.forgotPasswordText,
                          style: subHeaderTextStyle.copyWith(
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        gapLarge,
                        Expanded(
                          child: ListView(
                            children: [
                              const Text(AppStrings.email,
                                  style: bodyTextStyle),
                              gapTiny,
                              CustomInputText(
                                controller: model.emailController,
                                inputType: TextInputType.name,
                                hint: AppStrings.emailPlaceholder,
                                validate: FormValidation.emailValidation,
                              ),
                              gapMedium,
                              PrimaryBtn(
                                  title: AppStrings.continueTxt,
                                  isLoading: model.isBusy,
                                  onPress: () async {
                                    locator<GoRouter>().push(
                                      AppRoutes.otpTokenView,
                                      extra: model.emailController.text,
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
