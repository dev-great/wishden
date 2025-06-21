import 'package:flutter/material.dart';

class DialogRequestModel<T> {
  final String? title;
  final String? description;
  final bool? hasImage;
  final String? imageUrl;
  final String? mainButtonTitle;
  final bool? showIconInMainButton;
  final String? secondaryButtonTitle;
  final bool? showIconInSecondaryButton;
  final String? additionalButtonTitle;
  final bool? showIconInAdditionalButton;
  final bool? takesInput;
  final TextEditingController? controller;
  final String? inputText;
  final dynamic variant;
  final Color? mainColor;
  final bool? hasSecondaryButton;
  final VoidCallback? onTap;
  final T? data;

  DialogRequestModel(
      {this.onTap,
      this.mainColor,
      this.showIconInMainButton,
      this.showIconInSecondaryButton,
      this.showIconInAdditionalButton,
      this.title,
      this.description,
      this.hasImage,
      this.imageUrl,
      this.mainButtonTitle,
      this.secondaryButtonTitle,
      this.additionalButtonTitle,
      this.takesInput = false,
      this.inputText,
      this.data,
      this.controller,
      this.variant,
      this.hasSecondaryButton = false});
}
