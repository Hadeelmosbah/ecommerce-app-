import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';


  Future<void> errorcustomDialog({
    required BuildContext context,
    required String title,
    required String desc,
  }) {
    return AwesomeDialog(
      context: context,
      dialogType: DialogType.error,
      animType: AnimType.rightSlide,
      title: title,
      desc: desc,
      btnCancelOnPress: () {},
      btnOkOnPress: () {},
    ).show();
  }

