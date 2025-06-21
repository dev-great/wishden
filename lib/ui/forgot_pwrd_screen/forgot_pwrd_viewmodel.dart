import 'package:wishden/api/api_client.dart';
import 'package:wishden/api/api_uri.dart';
import 'package:wishden/app/locator/locator.dart';
import 'package:wishden/navigation/route.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stacked/stacked.dart';

class ForgotPasswordViewModel extends BaseViewModel {
  final emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<void> forgotPassword() async {
    if (emailController.text.isNotEmpty &&
        emailController.text.contains('@') &&
        emailController.text.contains('.')) {
      try {
        setBusy(true);
        Map<String, dynamic> data = {
          'email': emailController.text,
        };
        // CALL FORGOT PASSWORD REQUEST
        final apiResponse = await ApiClient.post(
          Endpoints.forgotPasswordURI,
          body: data,
          useToken: false,
        );
        if (apiResponse.statusCode == 200) {
          locator<GoRouter>().push(
            AppRoutes.otpTokenView,
            extra: emailController.text,
          );
        }
      } catch (e) {
        throw Exception('Failed to send reset token: $e');
      } finally {
        setBusy(false);
      }
    }
  }
}
