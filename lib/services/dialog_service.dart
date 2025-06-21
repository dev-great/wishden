import 'package:wishden/app/shared/app_basic_dialog.dart';
import 'package:wishden/models/app_model/app_dialog_request_model.dart';
import 'package:flutter/material.dart';
import 'package:one_context/one_context.dart';

Future showBasicDialog(DialogRequestModel request,
    {VoidCallback? onMainTap, VoidCallback? onSecondaryTap}) async {
  return OneContext().showDialog(
      builder: (context) => BasicDialog(
            request: request,
            onSecondaryTap: onSecondaryTap != null
                ? () async {
                    onSecondaryTap();
                    Navigator.of(context).pop();
                  }
                : () {
                    Navigator.of(context).pop();
                  },
            onMainTap: onMainTap != null
                ? () async {
                    onMainTap();
                    Navigator.of(context).pop();
                  }
                : () {
                    Navigator.of(context).pop();
                  },
          ));
}
