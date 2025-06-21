import 'dart:convert';
import 'dart:io';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:wishden/api/api_client.dart';
import 'package:wishden/api/api_custom_response.dart';
import 'package:wishden/api/api_uri.dart';
import 'package:wishden/app/locator/locator.dart';
import 'package:wishden/app/shared/app_decoration.dart';
import 'package:wishden/helpers/constant/app_local_storage.dart';
import 'package:wishden/navigation/route.dart';
import 'package:wishden/services/app_state_service.dart';
import 'package:wishden/services/local_storage_service.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:one_context/one_context.dart';
import 'package:stacked/stacked.dart';

class LoginViewModel extends BaseViewModel {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _localStorageService = locator<LocalStorageService>();
  final formKey = GlobalKey<FormState>();
  bool isVisible = true;

  void toggleVisibility() {
    isVisible = !isVisible;
    notifyListeners();
  }

  Future<void> loginUser() async {
    try {
      setBusy(true);
      Map<String, dynamic> data = {
        'email': emailController.text,
        'password': passwordController.text,
      };
      CustomResponse apiResponse;
      // CALL LOGIN REQUEST
      apiResponse = await ApiClient.post(
        Endpoints.loginURI,
        body: data,
        useToken: false,
      );

      if (apiResponse.statusCode == 200) {
        final userAccess = apiResponse.data['data']['auth']['access'];

        _localStorageService.saveDataToDisk(
            LocalStorageKeys.accessToken, userAccess);
        final userRefresh = apiResponse.data['data']['auth']['refresh'];
        final userData = apiResponse.data['data']['user'];

        _localStorageService.saveDataToDisk(
            LocalStorageKeys.userProfile, userData);

        // Ensure the correct key is used to save the access token
        _localStorageService.saveDataToDisk(
            LocalStorageKeys.accessToken, userAccess);

        _localStorageService.saveDataToDisk(
            LocalStorageKeys.refreshToken, userRefresh);

        if (apiResponse.data['data']['user']['is_verified'] == false) {
          locator<GoRouter>().push(AppRoutes.dashboardView);
        } else {
          locator<GoRouter>().push(AppRoutes.dashboardView);
        }
      }
    } catch (e) {
      OneContext().showSnackBar(
        builder: (_) => SnackBar(
          content: Text(
            'Failed to login: $e',
            style: bodyTextStyle,
          ),
        ),
      );
    } finally {
      setBusy(false);
    }
  }

  static String iosClientId =
      "225033688673-2lrog61v9bmjin2jjeei9oog5nf51lsq.apps.googleusercontent.com";

  final GoogleSignIn googleSignIn = Platform.isIOS
      ? GoogleSignIn(
          clientId: iosClientId,
          scopes: [
            'email',
          ],
        )
      : GoogleSignIn(
          scopes: <String>[
            'profile',
            'email',
            'https://www.googleapis.com/auth/contacts.readonly',
          ],
        );

  Future<void> googleRegisterLogic(String? token) async {
    try {
      setBusy(true);

      Map<String, dynamic> data = {
        'grant_type': "convert_token",
        'client_id': "67wYDvYRVIQCt8rQgDzOQzooo0owOTb3nIWwWfCn",
        'client_secret':
            "HSAiL7TTwdKw2weidqTn7IFp98qL8MbU0em4nLlwT1tju3FZDaoITaW7RFafOk1z83FfUpZxn3ZRZAW9FYKHqal1Ql8axSPBVxNyAM9s5KgTKhrER2S1d14MkuBeDBJI",
        'backend': "google-oauth2",
        'token': token,
      };

      final apiResponse = await ApiClient.post(Endpoints.verifySocialTokenURI,
          body: data, useToken: false);

      if (apiResponse.statusCode == 200) {
        _localStorageService.saveDataToDisk(
            LocalStorageKeys.accessToken, apiResponse.data['access_token']);
        _localStorageService.saveDataToDisk(
            LocalStorageKeys.refreshToken, apiResponse.data['refresh_token']);
        try {
          final apiResponseUser =
              await ApiClient.get(Endpoints.userURI, useToken: true);
          if (apiResponseUser.statusCode == 200) {
            _localStorageService.saveDataToDisk(LocalStorageKeys.userProfile,
                jsonEncode(apiResponseUser.data['data']));
            locator<AppStateService>().loginState = true;
            locator<AppStateService>().onboarding = true;
            locator<GoRouter>().push(AppRoutes.dashboardView);
          }
        } catch (e) {
          throw Exception('Fetch profile error: $e');
        }
      }
    } catch (e) {
      throw Exception('Failed to register account: $e');
    } finally {
      setBusy(false);
    }
  }

  Future<void> appleRegisterLogic(String? token) async {
    try {
      setBusy(true);

      Map<String, dynamic> data = {
        'grant_type': "convert_token",
        'client_id': "67wYDvYRVIQCt8rQgDzOQzooo0owOTb3nIWwWfCn",
        'client_secret':
            "HSAiL7TTwdKw2weidqTn7IFp98qL8MbU0em4nLlwT1tju3FZDaoITaW7RFafOk1z83FfUpZxn3ZRZAW9FYKHqal1Ql8axSPBVxNyAM9s5KgTKhrER2S1d14MkuBeDBJI",
        'backend': "apple-id",
        'token': token,
      };

      final apiResponse = await ApiClient.post(Endpoints.verifySocialTokenURI,
          body: data, useToken: false);

      if (apiResponse.statusCode == 200) {
        _localStorageService.saveDataToDisk(
            LocalStorageKeys.accessToken, apiResponse.data['access_token']);
        _localStorageService.saveDataToDisk(
            LocalStorageKeys.refreshToken, apiResponse.data['refresh_token']);
        try {
          final apiResponseUser =
              await ApiClient.get(Endpoints.userURI, useToken: true);
          if (apiResponseUser.statusCode == 200) {
            _localStorageService.saveDataToDisk(LocalStorageKeys.userProfile,
                jsonEncode(apiResponseUser.data['data']));
            locator<AppStateService>().loginState = true;
            locator<AppStateService>().onboarding = true;
            locator<GoRouter>().push(AppRoutes.dashboardView);
          }
        } catch (e) {
          throw Exception('Fetch profile error: $e');
        }
      }
    } catch (e) {
      throw Exception('Failed to register account: $e');
    } finally {
      setBusy(false);
    }
  }
}
