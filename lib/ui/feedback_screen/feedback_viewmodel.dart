import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class FeedBackScreenViewModel extends BaseViewModel {
  final subjectController = TextEditingController();
  final messageController = TextEditingController();
  final formKey = GlobalKey<FormState>();
}
