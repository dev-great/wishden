import 'package:wishden/app/locator/locator.dart';
import 'package:wishden/app/shared/app_decoration.dart';
import 'package:wishden/helpers/constant/app_colors.dart';
import 'package:wishden/helpers/constant/app_images.dart';
import 'package:wishden/helpers/constant/app_local_storage.dart';
import 'package:wishden/helpers/constant/app_lottie.dart';
import 'package:wishden/helpers/constant/app_string.dart';
import 'package:wishden/navigation/route.dart';
import 'package:wishden/services/local_storage_service.dart';
import 'package:wishden/ui/splash_screen/splash_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:stacked/stacked.dart';
import 'package:lottie/lottie.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({super.key});

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    super.initState();

    Future.delayed(const Duration(milliseconds: 5000), () {
      final localStorageService = locator<LocalStorageService>();
      if (localStorageService.getDataFromDisk(LocalStorageKeys.accessToken) !=
          null) {
        locator<GoRouter>().push(AppRoutes.dashboardView);
      } else {
        locator<GoRouter>().push(AppRoutes.welcomeView);
      }
    });
  }

  @override
  void dispose() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: AppColors.normalBlack,
      systemNavigationBarIconBrightness: Brightness.light,
    ));
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashScreenViewModel>.reactive(
        viewModelBuilder: () => SplashScreenViewModel(),
        builder: (context, model, child) {
          return Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.1, 0.3, 0.7, 0.9],
              colors: [
                AppColors.primaryDark,
                AppColors.primary,
                Color.fromARGB(255, 23, 20, 183),
                AppColors.primary,
              ],
            )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      AppImages.logow,
                      height: 79,
                      width: 79,
                    ),
                    Text(AppStrings.appName,
                        style:
                            subHeaderTextStyle.copyWith(color: AppColors.white))
                  ],
                ),
                ClipRect(
                  child: Align(
                    alignment: Alignment.center,
                    widthFactor: 0.5, // Adjust to crop horizontally
                    heightFactor: 0.2, // Adjust to crop vertically
                    child: Lottie.asset(AppLottie.loader, height: 150),
                  ),
                )
              ],
            ),
          );
        });
  }
}
