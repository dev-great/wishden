import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ChangepasswordScreenViewModel extends BaseViewModel {
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  bool isVisible1 = true;
  bool isVisible3 = true;
  bool isVisible2 = true;

  void toggleVisibility1() {
    isVisible1 = !isVisible1;
    notifyListeners();
  }

  void toggleVisibility3() {
    isVisible3 = !isVisible3;
    notifyListeners();
  }

  void toggleVisibility2() {
    isVisible2 = !isVisible2;
    notifyListeners();
  }
}
