import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:wishden/app/shared/app_buttons.dart';
import 'package:wishden/app/shared/app_decoration.dart';
import 'package:wishden/helpers/constant/app_colors.dart';
import 'package:wishden/helpers/constant/app_images.dart';
import 'package:wishden/helpers/constant/app_string.dart';
import 'package:wishden/helpers/constant/ui_helper.dart';
import 'package:wishden/ui/permission_screen/permission_viewmodel.dart';
import 'package:stacked/stacked.dart';

class PermissionView extends StatefulWidget {
  const PermissionView({super.key});

  @override
  State<PermissionView> createState() => _PermissionViewState();
}

class _PermissionViewState extends State<PermissionView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PermissionViewModel>.reactive(
      viewModelBuilder: () => PermissionViewModel(),
      onViewModelReady: (viewModel) {},
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          surfaceTintColor: AppColors.white,
          backgroundColor: AppColors.white,
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 20),
              child: Text(
                "Skip",
                style: bodyTextStyle.copyWith(color: AppColors.primary),
              ),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
          ),
          child: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      gapLarge,
                      gapLarge,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            model.permission == 1
                                ? AppImages.location
                                : model.permission == 2
                                    ? AppImages.notification
                                    : AppImages.contact,
                            height: 128,
                            width: 105,
                          )
                        ],
                      ),
                      gapMedium,
                      Text(
                        model.permission == 1
                            ? AppStrings.allowLocationAccess
                            : model.permission == 2
                                ? AppStrings.allowNotificationAccess
                                : AppStrings.allowContactAccess,
                        style: subHeaderTextStyle,
                      ),
                      gapMedium,
                      Text(
                        model.permission == 1
                            ? AppStrings.allowLocationAccessTxt
                            : model.permission == 2
                                ? AppStrings.allowNotificationAccessTxt
                                : AppStrings.allowContactAccessTxt,
                        style: subHeaderTextStyle.copyWith(
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      gapMedium,
                    ],
                  ),
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: AppStrings.permissionButtomText,
                          style: bodyTextStyle.copyWith(
                            color: AppColors.grayColor,
                          )),
                      TextSpan(
                        text: AppStrings.privacyPolicy,
                        style: bodyTextStyle.copyWith(
                          decoration: TextDecoration.underline,
                          color: AppColors.grayColor,
                          fontWeight: FontWeight.w600,
                        ),
                        recognizer: TapGestureRecognizer()..onTap = () {},
                      ),
                    ],
                  ),
                ),
                gapMedium,
                PrimaryBtn(
                  title: AppStrings.continueTxt,
                  onPress: () {
                    model.toggleAddPermission();
                  },
                ),
                gapMedium,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
