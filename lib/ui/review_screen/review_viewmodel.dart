import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ReviewScreenViewModel extends BaseViewModel {
  final subjectController = TextEditingController();
  final messageController = TextEditingController();
  final formKey = GlobalKey<FormState>();
}
