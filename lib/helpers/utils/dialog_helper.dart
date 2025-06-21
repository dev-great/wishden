import 'package:wishden/app/styels/ui_helper.dart';
import 'package:wishden/helpers/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:one_context/one_context.dart';

showErrorDialog(response) {
  return OneContext().showDialog(
      builder: (context) => AlertDialog(
            content: response == null
                ? const Text("Something went wrong")
                : Text("$response"),
            actions: <Widget>[
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelLarge,
                ),
                child: const Text('Ok'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ));
}

Future<dynamic> showNetworkAlert(BuildContext context, Function()? action) {
  // ignore: unused_local_variable
  var isDeviceConnected = false;
  return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) => AlertDialog(
            actionsPadding: EdgeInsets.zero,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            title: const Text(
              "No Connection",
              style: TextStyle(color: AppColors.primary),
              textAlign: TextAlign.center,
            ),
            content: Padding(
              padding: const EdgeInsets.all(15.0),
              child: SizedBox(
                height: screenHeight(context, 7),
                child: const Column(
                  children: [
                    Icon(
                      Icons.portable_wifi_off_rounded,
                      size: 45,
                      color: Colors.red,
                    ),
                    Text(
                      "Please check your internet connectivity",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
            actions: [
              TextButton(
                  onPressed: action,
                  child: Container(
                      padding: const EdgeInsets.all(10),
                      color: AppColors.primary,
                      child: const Text(
                        "Retry",
                        style: TextStyle(color: Colors.white),
                      )))
            ],
          ));
}
