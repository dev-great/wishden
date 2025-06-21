import 'dart:async';
import 'dart:io';
import 'package:wishden/app/app.dart';
import 'package:wishden/app/locator/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  run();
}

void run() async {
  runZonedGuarded(() async {
    debugRepaintRainbowEnabled = false;
    WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
    await setUpLocator();
    HttpOverrides.global = MyHttpOverrides();
    runApp(Wishden());
  }, (error, stack) {});
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
