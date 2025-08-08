import 'package:ecommerce_app/auth/views/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class CustomDialog {
  static void showDialogMessage({
    required BuildContext context,
    required String message,
    required DialogType type,
  }) {
    AwesomeDialog(
      context: context,
      dialogType: type,
      animType: AnimType.rightSlide,
      desc: message,
      btnCancelOnPress: () {},
      btnOkOnPress: () {
        if (type == DialogType.success) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => LoginScreen()),
          );
        }
      },
    ).show();
  }
}
