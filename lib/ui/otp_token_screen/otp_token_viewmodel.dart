import 'dart:async';

import 'package:wishden/api/api_client.dart';
import 'package:wishden/api/api_uri.dart';
import 'package:wishden/app/locator/locator.dart';
import 'package:wishden/navigation/route.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:stacked/stacked.dart';

class OTPTokenViewModel extends BaseViewModel {
  TextEditingController passcodeController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  StreamController<ErrorAnimationType>? errorController =
      StreamController<ErrorAnimationType>();

  @override
  bool hasError = false;
  String currentText = "";

  void setControllerPin(String pinText) {
    currentText = pinText;
    notifyListeners();
  }

  Future<void> otpVerify() async {
    try {
      setBusy(true);
      Map<String, dynamic> data = {
        'token': passcodeController.text,
      };
      // CALL FORGOT PASSWORD REQUEST
      final apiResponse = await ApiClient.post(
        Endpoints.verifyOTPURI,
        body: data,
        useToken: false,
      );
      if (apiResponse.statusCode == 200) {
        locator<GoRouter>().push(
          AppRoutes.createPasswordView,
          extra: passcodeController.text,
        );
      }
    } catch (e) {
      throw Exception('Failed to verify reset token: $e');
    } finally {
      setBusy(false);
    }
  }
}
