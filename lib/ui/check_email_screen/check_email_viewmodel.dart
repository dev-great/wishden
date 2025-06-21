import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:wishden/app/locator/locator.dart';
import 'package:wishden/services/local_storage_service.dart';

class CheckEmailViewModel extends BaseViewModel {
  final localStorageService = locator<LocalStorageService>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isUser = false;
  bool isVisible = false;

  toogleisUser(bool value) {
    isUser = value;
    notifyListeners();
  }

  void toggleVisibility() {
    isVisible = !isVisible;
    notifyListeners();
  }
}
