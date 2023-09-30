import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Styling {
  static const textStyle = TextStyle(fontSize: 20, fontWeight: FontWeight.w400);
  static const textStyleWord =
      TextStyle(fontSize: 20, fontWeight: FontWeight.bold);

  static void showToast(final String text) {
    Fluttertoast.showToast(
        msg: text,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        fontSize: 16.0);
  }
}
