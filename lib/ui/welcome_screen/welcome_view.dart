import 'package:go_router/go_router.dart';
import 'package:wishden/app/locator/locator.dart';
import 'package:wishden/app/shared/app_buttons.dart';
import 'package:wishden/app/shared/app_decoration.dart';
import 'package:wishden/app/styels/ui_helper.dart';
import 'package:wishden/helpers/constant/app_colors.dart';
import 'package:wishden/helpers/constant/app_images.dart';
import 'package:wishden/helpers/constant/app_string.dart';
import 'package:wishden/helpers/constant/ui_helper.dart';
import 'package:wishden/navigation/route.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wishden/ui/welcome_screen/welcome_viewmodel.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(
    //     const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return ViewModelBuilder<WelcomeViewModel>.reactive(
      viewModelBuilder: () => WelcomeViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.1, 0.3, 0.7, 0.9],
                  colors: [
                    AppColors.primaryDark,
                    AppColors.primary,
                    AppColors.primaryDark,
                    AppColors.primary,
                  ],
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 3,
                      width: MediaQuery.of(context).size.width,
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              AppImages.logow,
                              height: 79,
                              width: 79,
                            ),
                            Text(AppStrings.appName,
                                style: subHeaderTextStyle.copyWith(
                                    color: AppColors.white))
                          ],
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      child: Container(
                        height: screenHeight(context, 1.5),
                        width: screenWidth(context, 1),
                        decoration: const BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(45),
                                topRight: Radius.circular(45))),
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, bottom: 10),
                            child: SingleChildScrollView(
                              child: ConstrainedBox(
                                constraints: BoxConstraints(
                                  maxHeight: screenHeight(context, 1.6),
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    gapMedium,
                                    Text(
                                      AppStrings.welcome,
                                      style: headerTextStyle.copyWith(
                                        color: AppColors.primary,
                                        decoration: TextDecoration.none,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    Text(
                                      AppStrings
                                          .reserveTablesWithSeamlessPrecision,
                                      style: bodyTextStyle.copyWith(
                                          color: AppColors.deepBlack,
                                          fontSize: 18,
                                          decoration: TextDecoration.none),
                                      textAlign: TextAlign.center,
                                    ),
                                    gapSmall,
                                    PrimaryBtn(
                                      title: AppStrings.continueEmail,
                                      onPress: () {
                                        locator<GoRouter>()
                                            .push(AppRoutes.checkEmailView);
                                      },
                                      color: AppColors.primary.withOpacity(0.1),
                                      borderColor: const Color.fromARGB(
                                              255, 210, 189, 245)
                                          .withOpacity(0.1),
                                      textColor: AppColors.primary,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 1,
                                          width: screenWidth(context, 3.5),
                                          color: AppColors.grayColor,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Text(
                                            AppStrings.or,
                                            style: bodyTextStyle.copyWith(
                                                color: AppColors.grayColor),
                                          ),
                                        ),
                                        Container(
                                          height: 1,
                                          width: screenWidth(context, 3.5),
                                          color: AppColors.grayColor,
                                        ),
                                      ],
                                    ),
                                    PrimaryBtn(
                                      title: AppStrings.continueGoogle,
                                      onPress: () {
                                        locator<GoRouter>()
                                            .push(AppRoutes.dashboardView);
                                      },
                                      isIcon: true,
                                      icon: FontAwesomeIcons.google,
                                      iconColor: AppColors.white,
                                      color: AppColors.blueColor,
                                      borderColor: AppColors.blueColor,
                                    ),
                                    gapTiny,
                                    PrimaryBtn(
                                      title: AppStrings.continueApple,
                                      onPress: () {},
                                      isIcon: true,
                                      icon: FontAwesomeIcons.apple,
                                      iconColor: AppColors.white,
                                      borderColor: AppColors.deepBlack,
                                      color: AppColors.deepBlack,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
