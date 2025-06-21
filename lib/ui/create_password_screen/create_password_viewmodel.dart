import 'package:wishden/api/api_client.dart';
import 'package:wishden/api/api_uri.dart';
import 'package:wishden/app/locator/locator.dart';
import 'package:wishden/helpers/constant/app_string.dart';
import 'package:wishden/navigation/route.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stacked/stacked.dart';

class CreatePasswordViewModel extends BaseViewModel {
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  bool isVisible = true;
  late String otp;

  void toggleVisibility() {
    isVisible = !isVisible;
    notifyListeners();
  }

  @override
  void dispose() {
    passwordController.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

  final List<String> validationRules = [
    AppStrings.passwordValidationTxt1,
    AppStrings.passwordValidationTxt2,
    AppStrings.passwordValidationTxt3,
    AppStrings.passwordValidationTxt4,
  ];

  final List<bool> validationStatus = [false, false, false, false];
  final passwordFocusNode = FocusNode();

  void validatePassword(String password) {
    validationStatus[0] = password.length > 8;
    validationStatus[1] = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])').hasMatch(password);
    validationStatus[2] = RegExp(r'^(?=.*\d)').hasMatch(password);
    validationStatus[3] =
        RegExp(r'^(?=.*[!@#$%^&*(),.?":{}|<>])').hasMatch(password);
    notifyListeners();
  }

  Future<void> changePassword() async {
    if (confirmPasswordController.text == passwordController.text) {
      try {
        setBusy(true);
        Map<String, dynamic> data = {
          'password': passwordController.text,
          'token': otp,
        };
        // CALL FORGOT PASSWORD REQUEST
        final apiResponse = await ApiClient.post(
          Endpoints.resetPasswordURI,
          body: data,
          useToken: false,
        );
        if (apiResponse.statusCode == 200) {
          locator<GoRouter>().push(AppRoutes.loginView);
        }
      } catch (e) {
        throw Exception('Failed to reset password: $e');
      } finally {
        setBusy(false);
      }
    } else {
      throw Exception('Failed to reset password');
    }
  }
}
