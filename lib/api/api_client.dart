import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:one_context/one_context.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:wishden/api/api_custom_response.dart';
import 'package:wishden/api/api_uri.dart';
import 'package:wishden/app/locator/locator.dart';
import 'package:wishden/app/shared/app_decoration.dart';
import 'package:wishden/helpers/constant/app_colors.dart';
import 'package:wishden/helpers/constant/app_local_storage.dart';
import 'package:wishden/models/app_model/app_dialog_request_model.dart';
import 'package:wishden/models/enums/emum.dart';
import 'package:wishden/services/dialog_service.dart';
import 'package:wishden/services/local_storage_service.dart';

class ApiClient {
  final _localStorage = ReactiveValue<SharedPreferences?>(null);
  SharedPreferences? get localStorage => _localStorage.value;

  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: Endpoints.baseURI,
      connectTimeout: const Duration(minutes: 4),
      receiveTimeout: const Duration(minutes: 4),
    ),
  );
  static String get _token => _getToken();
  static Future<CustomResponse> get(String endpoint,
      {Map<String, dynamic>? queryParameters,
      bool useToken = true,
      bool isImage = false}) async {
    final result = await _makeRequest(() async {
      final response = await _dio.get(
        endpoint,
        queryParameters: queryParameters,
        options: _buildOptions(useToken, isImage),
      );
      return CustomResponse(
          data: response.data,
          message: response.statusMessage!,
          statusCode: response.statusCode!);
    });
    return result;
  }

  static Future<CustomResponse> post(String endpoint,
      {dynamic body, bool useToken = true, bool isImage = false}) async {
    final result = await _makeRequest(() async {
      final response = await _dio.post(
        endpoint,
        data: body,
        options: _buildOptions(useToken, isImage),
      );
      return CustomResponse(
          data: response.data,
          message: response.statusMessage!,
          statusCode: response.statusCode!);
    });
    return result;
  }

  static Future<CustomResponse> delete(String endpoint,
      {dynamic body, bool useToken = true, bool isImage = false}) async {
    final result = await _makeRequest(() async {
      final response = await _dio.delete(
        endpoint,
        options: _buildOptions(useToken, isImage),
      );
      return CustomResponse(
          data: response.data,
          message: response.statusMessage!,
          statusCode: response.statusCode!);
    });
    return result;
  }

  static Future<CustomResponse> patch(String endpoint,
      {dynamic body, bool useToken = true, bool isImage = false}) async {
    final result = await _makeRequest(() async {
      final response = await _dio.patch(
        endpoint,
        data: body,
        options: _buildOptions(useToken, isImage),
      );
      return CustomResponse(
          data: response.data,
          message: response.statusMessage!,
          statusCode: response.statusCode!);
    });
    return result;
  }

  static Future<CustomResponse> put(String endpoint,
      {required dynamic body,
      bool useToken = true,
      bool isImage = false}) async {
    final result = await _makeRequest(() async {
      final response = await _dio.put(
        endpoint,
        data: body,
        options: _buildOptions(useToken, isImage),
      );
      return CustomResponse(
          data: response.data,
          message: response.statusMessage!,
          statusCode: response.statusCode!);
    });
    return result;
  }

  static Options _buildOptions(bool useToken, bool isImage) {
    final header = {
      'Content-Type': isImage ? 'multipart/form-data' : 'application/json',
      'accept': '*/*',
    };
    if (useToken) {
      header.addAll(
        {'Authorization': 'bearer $_token'},
      );
    }

    return Options(headers: header);
  }

  static Future _makeRequest(Function() request) async {
    try {
      final result = await request();
      return result;
    } on DioException catch (e) {
      _handleDioError(e);
      return CustomResponse(
          data: e.message,
          message: e.toString(),
          statusCode: e.response?.statusCode ?? 500);
    } on SocketException catch (e) {
      _handleSocketException(e);
      return CustomResponse(
          data: e.message, message: e.toString(), statusCode: e.port!);
    } catch (e) {
      return CustomResponse(data: " ", message: e.toString(), statusCode: 500);
    }
  }

  static void _handleDioError(DioException e) {
    final responseCode = e.response?.statusCode;
    if (responseCode == 401) {
      // locator<LocalStorageService>()
      //     .removeDataFromDisk(LocalStorageKeys.accessToken);
      // locator<LocalStorageService>()
      //     .removeDataFromDisk(LocalStorageKeys.refreshToken);
      // locator<AppStateService>().loginState = false;
    }
    if (responseCode == 400) {
      // OneContext.instance.showDialog(
      //   builder: (BuildContext context) => Text(
      //     e.response!.data.toString(),
      //     style: bodyTextStyle.copyWith(color: AppColors.white),
      //   ),
      // );
      OneContext().showSnackBar(
        builder: (_) => SnackBar(
          backgroundColor: AppColors.primary,
          content: Text(
            e.response?.data["message"],
            style: bodyTextStyle.copyWith(color: AppColors.white),
          ),
        ),
      );
    } else if (responseCode == 403) {
      OneContext().showSnackBar(
        builder: (_) => SnackBar(
          backgroundColor: AppColors.primary,
          content: Text(
            "Forbidden: You are not authorized to access this resource.",
            style: bodyTextStyle.copyWith(color: AppColors.white),
          ),
        ),
      );
    } else if (responseCode == 404) {
      OneContext().showSnackBar(
        builder: (_) => SnackBar(
          backgroundColor: AppColors.primary,
          content: Text(
            "Not Found: The requested resource was not found.",
            style: bodyTextStyle.copyWith(color: AppColors.white),
          ),
        ),
      );
    } else if (responseCode == 500) {
      OneContext().showSnackBar(
        builder: (_) => SnackBar(
          backgroundColor: AppColors.primary,
          content: Text(
            "Internal Server Error: An unexpected error occurred on the server.",
            style: bodyTextStyle.copyWith(color: AppColors.white),
          ),
        ),
      );
    } else if (responseCode == 422) {
      showBasicDialog(DialogRequestModel(
          title: e.response?.data["message"],
          variant: DialogType.basic,
          data: BasicDialogStatus.error,
          description: e.response!.data['Message'].toString(),
          mainButtonTitle: "Okay"));
    }
    inspect(e.response);
  }

  static void _handleSocketException(SocketException e) {
    OneContext.instance.showDialog(
      builder: (BuildContext context) =>
          const Text("Network Error: Check your internet connection."),
    );
  }

  static String _getToken() {
    String token = locator<LocalStorageService>()
        .getDataFromDisk(LocalStorageKeys.accessToken);
    return token;
  }
}
