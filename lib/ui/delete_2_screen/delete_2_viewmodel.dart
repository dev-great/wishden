import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class Delete2ScreenViewModel extends BaseViewModel {
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  bool isVisible = true;
  late String otp;

  void toggleVisibility() {
    isVisible = !isVisible;
    notifyListeners();
  }
}
