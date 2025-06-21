import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:one_context/one_context.dart';
import 'package:wishden/app/locator/locator.dart';
import 'package:wishden/app/shared/app_buttons.dart';
import 'package:wishden/app/shared/app_decoration.dart';
import 'package:wishden/app/shared/app_password_field.dart';
import 'package:wishden/helpers/constant/app_colors.dart';
import 'package:wishden/helpers/constant/ui_helper.dart';
import 'package:wishden/helpers/utils/form_validator.dart';
import 'package:wishden/ui/set_password_screen/set_password_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stacked/stacked.dart';

class SetPasswordView extends StatelessWidget {
  const SetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SetPasswordViewModel>.reactive(
        viewModelBuilder: () => SetPasswordViewModel(),
        builder: (context, model, child) => Scaffold(
              backgroundColor: AppColors.white,
              appBar: AppBar(
                backgroundColor: AppColors.white,
                surfaceTintColor: AppColors.white,
                centerTitle: true,
                automaticallyImplyLeading: false,
                leading: GestureDetector(
                  onTap: () => locator<GoRouter>().pop(context),
                  child: const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Icon(
                      Iconsax.arrow_left_2_copy,
                      size: 20,
                    ),
                  ),
                ),
              ),
              body: SafeArea(
                child: Form(
                  key: model.formKey,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Set Your Password",
                            style: subHeaderTextStyle),
                        gapTiny,
                        const Text(
                          "Create a secure password for your account",
                          style: bodyTextStyle,
                        ),
                        gapMedium,
                        Expanded(
                          child: ListView(
                            children: [
                              const Text(
                                "New Password",
                                style: bodyTextStyle,
                              ),
                              gapTiny,
                              PasswordFormField(
                                controller: model.passwordController,
                                isObscure: model.isVisible1,
                                onTap: () => model.toggleVisibility1(),
                                hint: "* * * * * *",
                                validate: FormValidation.passwordValidation,
                              ),
                              gapSmall,
                              gapSmall,
                              const Text(
                                "Re-enter new password",
                                style: bodyTextStyle,
                              ),
                              gapTiny,
                              PasswordFormField(
                                controller: model.confirmPasswordController,
                                isObscure: model.isVisible2,
                                onTap: () => model.toggleVisibility2(),
                                hint: "* * * * * *",
                                validate: FormValidation.passwordValidation,
                              ),
                            ],
                          ),
                        ),
                        PrimaryBtn(
                            title: "Create Password",
                            isLoading: model.isBusy,
                            onPress: () async {
                              if (model.formKey.currentState!.validate()) {
                                await model.registerLogic();
                              } else {
                                OneContext().showSnackBar(
                                  builder: (_) => const SnackBar(
                                    content: Text(
                                      'Password and confirm password has to be the same text.',
                                      style: bodyTextStyle,
                                    ),
                                  ),
                                );
                              }
                            }),
                        gapLarge,
                      ],
                    ),
                  ),
                ),
              ),
            ));
  }
}
