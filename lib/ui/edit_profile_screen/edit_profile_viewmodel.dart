import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class EditProfileScreenViewModel extends BaseViewModel {
  final fullnameController = TextEditingController();
  final emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  final locationController = TextEditingController();
}
