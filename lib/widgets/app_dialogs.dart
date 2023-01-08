import 'package:flutter/material.dart';

class AppDialog {
  AppDialog._();

  static Future<void> simpleDialog(BuildContext context) async {
    return showDialog(
      context: context,
      barrierDismissible: false, // prevents dismissing the dialog by tapping outside
      builder: (context) {
        return AlertDialog(
          key: const Key('alert_dialog'),
          title: const Text('Hello, World'),
          content: const Text('This is a simple Flutter dialog'),
          actions: [
            TextButton(
              child: const Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
