import 'package:go_router/go_router.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:wishden/app/locator/locator.dart';
import 'package:wishden/app/shared/app_buttons.dart';
import 'package:wishden/app/shared/app_decoration.dart';
import 'package:wishden/app/shared/app_header.dart';
import 'package:wishden/app/shared/app_input_text.dart';
import 'package:wishden/app/shared/app_password_field.dart';
import 'package:wishden/helpers/constant/app_country.dart';
import 'package:wishden/helpers/constant/app_string.dart';
import 'package:wishden/helpers/constant/ui_helper.dart';
import 'package:wishden/helpers/utils/form_validator.dart';
import 'package:wishden/navigation/route.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';
import 'package:wishden/app/styels/ui_helper.dart';
import 'package:wishden/helpers/constant/app_colors.dart';
import 'package:wishden/ui/registration_screen/registration_viewmodel.dart';
import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_picker_dropdown.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RegisterViewModel>.reactive(
      viewModelBuilder: () => RegisterViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: AppHeader(title: ''),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Form(
              key: model.formKey,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: SizedBox(
                  height: screenHeight(context, 1.1),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      gapMedium,
                      const Text(
                        AppStrings.createAccount,
                        style: subHeaderTextStyle,
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
                        AppStrings.phoneNumber,
                        style: bodyTextStyle,
                      ),
                      gapSmall,
                      CustomInputText(
                          prefix: SizedBox(
                            height: 50,
                            width: screenWidth(context, 4.4),
                            child: CountryPickerDropdown(
                              initialValue: 'US',
                              itemBuilder: model.buildCustomDropdownItem,
                              itemFilter: (Country country) {
                                return allCountries.contains(country.isoCode);
                              },
                              isExpanded: true,
                              iconSize: 20,
                              icon: const Icon(Iconsax.arrow_down_1_copy),
                              sortComparator: (Country a, Country b) =>
                                  a.isoCode.compareTo(b.isoCode),
                              onValuePicked: (Country country) {
                                setState(() {
                                  model.countryCode = country.phoneCode;
                                });
                              },
                            ),
                          ),
                          inputType: TextInputType.phone,
                          hint: AppStrings.phoneNumberPlaceholder),
                      gapMedium,
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
      ),
    );
  }
}
