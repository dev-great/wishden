import 'package:wishden/app/locator/locator.dart';
import 'package:wishden/helpers/constant/app_colors.dart';
import 'package:wishden/helpers/constant/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:go_router/go_router.dart';
import 'package:one_context/one_context.dart';

class Wishden extends StatelessWidget {
  Wishden({super.key});
  final _router = locator<GoRouter>();
  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    return MaterialApp.router(
        title: "Wishden",
        routerConfig: _router,
        theme: AppThemes.main(primaryColor: AppColors.primaryColorOptions[0]),
        debugShowCheckedModeBanner: false,
        builder: OneContext().builder);
  }
}
