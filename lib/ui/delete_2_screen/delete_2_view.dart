import 'package:wishden/app/locator/locator.dart';
import 'package:wishden/app/shared/app_buttons.dart';
import 'package:wishden/app/shared/app_decoration.dart';
import 'package:wishden/app/shared/app_header.dart';
import 'package:wishden/app/shared/app_input_text.dart';
import 'package:wishden/app/shared/app_password_field.dart';
import 'package:wishden/app/styels/ui_helper.dart';
import 'package:wishden/helpers/constant/app_colors.dart';
import 'package:wishden/helpers/constant/app_string.dart';
import 'package:wishden/helpers/constant/ui_helper.dart';
import 'package:wishden/helpers/utils/form_validator.dart';
import 'package:wishden/navigation/route.dart';
import 'package:wishden/ui/delete_2_screen/delete_2_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stacked/stacked.dart';

class Delete2ScreenView extends StatefulWidget {
  const Delete2ScreenView({super.key});

  @override
  State<Delete2ScreenView> createState() => _Delete2ScreenViewState();
}

class _Delete2ScreenViewState extends State<Delete2ScreenView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<Delete2ScreenViewModel>.reactive(
        viewModelBuilder: () => Delete2ScreenViewModel(),
        builder: (context, model, child) => Scaffold(
              backgroundColor: AppColors.backgroundColor,
              appBar: AppHeader(title: AppStrings.deleteAccount),
              body: SafeArea(
                child: Form(
                  key: model.formKey,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        gapMedium,
                        Text("Enter your password to continue",
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
                              gapMedium,
                              PrimaryBtn(
                                  title: AppStrings.continueTxt,
                                  isLoading: model.isBusy,
                                  onPress: () async {
                                    showCancleBottomSheet(context);
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

  void showCancleBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        backgroundColor: AppColors.backgroundColor,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        builder: (BuildContext context) {
          return StatefulBuilder(builder: (context, setState) {
            return SizedBox(
              height: MediaQuery.of(context).size.height / 1.6,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Final confrimation",
                          style: bodyTextStyle.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: AppColors.deepBlack),
                        ),
                      ],
                    ),
                    gapTiny,
                    const Divider(),
                    gapTiny,
                    Text(
                      "Are you absolutely sure you want to delete your account? This will permanently remove all your data and cannot be undone.",
                      style: bodyTextStyle.copyWith(fontSize: 16),
                    ),
                    gapMedium,
                    const CustomInputText(
                        inputType: TextInputType.text, hint: "Select Subject"),
                    gapMedium,
                    const CustomInputText(
                      inputType: TextInputType.text,
                      hint: "Reasons for deleting account *",
                      max: 5,
                    ),
                    gapMedium,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        PrimaryBtn(
                          title: "Keep Account",
                          onPress: () {},
                          width: screenWidth(context, 2.3),
                          color: AppColors.backgroundColor,
                          textColor: AppColors.deepBlack,
                          borderColor: AppColors.grayColor,
                        ),
                        PrimaryBtn(
                          title: "Delete Account",
                          onPress: () {
                            successfulDeleteBottomSheet(context);
                          },
                          width: screenWidth(context, 2.3),
                        ),
                      ],
                    ),
                    gapMedium,
                  ],
                ),
              ),
            );
          });
        });
  }

  void successfulDeleteBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        backgroundColor: AppColors.white,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        builder: (BuildContext context) {
          return StatefulBuilder(builder: (context, setState) {
            return SizedBox(
              height: MediaQuery.of(context).size.height / 2.3,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Final confrimation",
                          style: bodyTextStyle.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: AppColors.deepBlack),
                        ),
                      ],
                    ),
                    gapTiny,
                    const Divider(),
                    gapTiny,
                    Text(
                      "We're sad to see you leave. If you change your mind, feel free to create an account to continue enjoying seamless table reservations",
                      style: bodyTextStyle.copyWith(fontSize: 16),
                    ),
                    gapMedium,
                    PrimaryBtn(
                      title: "Log in",
                      onPress: () {
                        locator<GoRouter>().push(
                          AppRoutes.checkEmailView,
                        );
                      },
                    ),
                    gapMedium,
                    PrimaryBtn(
                      title: "Create Account",
                      onPress: () {
                        locator<GoRouter>().push(
                          AppRoutes.registerView,
                        );
                      },
                      color: AppColors.white,
                      borderColor: AppColors.primary,
                      textColor: AppColors.primary,
                    ),
                  ],
                ),
              ),
            );
          });
        });
  }
}
