import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stacked/stacked.dart';
import 'package:wishden/api/api_client.dart';
import 'package:wishden/api/api_uri.dart';
import 'package:wishden/app/locator/locator.dart';
import 'package:wishden/helpers/constant/app_local_storage.dart';
import 'package:wishden/navigation/route.dart';
import 'package:wishden/services/app_state_service.dart';
import 'package:wishden/services/local_storage_service.dart';

class SetPasswordViewModel extends BaseViewModel {
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final _localStorageService = locator<LocalStorageService>();
  final formKey = GlobalKey<FormState>();

  bool isVisible1 = true;
  bool isVisible2 = true;
  late String otp;

  void toggleVisibility1() {
    isVisible1 = !isVisible1;
    notifyListeners();
  }

  void toggleVisibility2() {
    isVisible2 = !isVisible2;
    notifyListeners();
  }

  Future<void> registerLogic() async {
    if (confirmPasswordController.text == passwordController.text) {
      try {
        setBusy(true);
        String userRegData = _localStorageService.getDataFromDisk("userReg");
        Map<String, dynamic> output = jsonDecode(userRegData);

        Map<String, dynamic> data = {
          'email': output['email'],
          'password': passwordController.text,
          'first_name': output['first_name'],
          'last_name': output['last_name'],
          'is_verified': false,
          'is_social_user': false,
        };
        // CALL FORGOT PASSWORD REQUEST
        final apiResponse = await ApiClient.post(
          Endpoints.registerURI,
          body: data,
          useToken: false,
        );
        if (apiResponse.statusCode == 201) {
          _localStorageService.saveDataToDisk(LocalStorageKeys.userProfile,
              jsonEncode(apiResponse.data['data']['user']));

          // Ensure the correct key is used to save the access token
          _localStorageService.saveDataToDisk(
              LocalStorageKeys.accessToken, apiResponse.data['data']['access']);

          _localStorageService.saveDataToDisk(LocalStorageKeys.refreshToken,
              apiResponse.data['data']['refresh']);

          locator<AppStateService>().loginState = true;
          locator<AppStateService>().onboarding = true;
          locator<GoRouter>().push(AppRoutes.dashboardView);
        }
      } catch (e) {
        throw Exception('Failed to register account: $e');
      } finally {
        setBusy(false);
      }
    } else {
      throw Exception('Failed to register account');
    }
  }
}
