import 'dart:convert';
import 'dart:io';

import 'package:country_pickers/country.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:wishden/api/api_client.dart';
import 'package:wishden/api/api_uri.dart';
import 'package:wishden/app/locator/locator.dart';
import 'package:wishden/app/shared/app_decoration.dart';
import 'package:wishden/helpers/constant/app_local_storage.dart';
import 'package:wishden/helpers/constant/ui_helper.dart';
import 'package:wishden/navigation/route.dart';
import 'package:wishden/services/app_state_service.dart';
import 'package:wishden/services/local_storage_service.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stacked/stacked.dart';

class RegisterViewModel extends BaseViewModel {
  final _localStorageService = locator<LocalStorageService>();
  final fullnameController = TextEditingController();
  final emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool isVisible = true;
  late String otp;

  void toggleVisibility() {
    isVisible = !isVisible;
    notifyListeners();
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

  Future<void> veriryUserEmail() async {
    try {
      setBusy(true);

      List<String> names = fullnameController.text.split(" ");
      Map<String, dynamic> data = {
        'email': emailController.text,
      };
      final apiResponse = await ApiClient.post(
        Endpoints.verifyEmailURI,
        body: data,
        useToken: false,
      );
      if (apiResponse.statusCode == 200) {
        try {
          Map<String, dynamic> userData = {
            'first_name': names.first,
            'last_name': names[1],
            'email': emailController.text,
          };
          _localStorageService.saveDataToDisk("userReg", userData);
          // locator<AppStateService>().loginState = true;
        } catch (e) {
          throw Exception('Error message: $e');
        }
      }
    } catch (e) {
      throw Exception('Failed to Send OTP: $e');
    } finally {
      setBusy(false);
    }
  }

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

  String countryCode = '+1';
  Widget buildCustomDropdownItem(Country country) {
    return SizedBox(
      width: 77,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          horizontalSpaceTiny,
          SizedBox(
            height: 15,
            width: 23,
            child: CountryPickerUtils.getDefaultFlagImage(country),
          ),
          horizontalSpaceTiny,
          Text(
            "+ ${country.phoneCode}",
            style: bodyTextStyle.copyWith(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
