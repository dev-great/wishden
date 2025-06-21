import 'package:wishden/app/shared/app_header.dart';
import 'package:wishden/app/shared/app_input_text.dart';
import 'package:wishden/helpers/constant/app_string.dart';
import 'package:wishden/navigation/route.dart';
import 'package:wishden/app/locator/locator.dart';
import 'package:wishden/app/shared/app_buttons.dart';
import 'package:wishden/app/shared/app_decoration.dart';
import 'package:wishden/helpers/constant/app_colors.dart';
import 'package:wishden/helpers/constant/ui_helper.dart';
import 'package:wishden/helpers/utils/form_validator.dart';
import 'package:wishden/ui/otp_token_screen/otp_token_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stacked/stacked.dart';

class OTPTokenView extends StatefulWidget {
  final String email;
  const OTPTokenView({super.key, required this.email});

  @override
  State<OTPTokenView> createState() => _OTPTokenViewState();
}

class _OTPTokenViewState extends State<OTPTokenView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OTPTokenViewModel>.reactive(
      viewModelBuilder: () => OTPTokenViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: AppHeader(title: AppStrings.forgotPassword),
        body: Form(
          key: model.formKey,
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                gapMedium,
                Text(
                  "OTP have been sent to ",
                  style:
                      subHeaderTextStyle.copyWith(fontWeight: FontWeight.w200),
                ),
                Text("johndoe@demo.com",
                    style: subHeaderTextStyle.copyWith(
                        color: AppColors.deepBlack)),
                gapLarge,
                Expanded(
                  child: ListView(
                    children: [
                      const Text(AppStrings.otp, style: bodyTextStyle),
                      gapTiny,
                      CustomInputText(
                        controller: model.passcodeController,
                        inputType: TextInputType.name,
                        hint: AppStrings.otpPlaceholder,
                        validate: FormValidation.emailValidation,
                      ),
                      gapMedium,
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(AppStrings.resendOTP, style: bodyTextStyle),
                          Text("23s", style: bodyTextStyle),
                        ],
                      ),
                      gapMedium,
                      PrimaryBtn(
                          title: AppStrings.verify,
                          isLoading: model.isBusy,
                          onPress: () async {
                            locator<GoRouter>().push(
                              AppRoutes.createPasswordView,
                              extra: model.passcodeController.text,
                            );
                          }),
                      gapLarge,
                      gapLarge,
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
