import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

class Utils {
  static toastMessage(String message) {
    Fluttertoast.showToast(
        msg: message,
        backgroundColor: Colors.red.shade600,
        textColor: Colors.black,
        fontSize: 16,
        toastLength: Toast.LENGTH_LONG);
  }

  static void flushbarErrorMessage(String message, BuildContext context) {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        forwardAnimationCurve: Curves.bounceInOut,
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        padding: const EdgeInsets.all(10),
        titleColor: Colors.white,
        reverseAnimationCurve: Curves.easeInOut,
        flushbarPosition: FlushbarPosition.TOP,
        positionOffset: 20,
        icon: const Icon(Icons.error, size: 28, color: Colors.white),
        message: message,
        //title: 'Flush Messages',
        borderRadius: BorderRadius.circular(8),
        messageColor: Colors.black,
        backgroundColor: Colors.red.shade600,
        duration: const Duration(seconds: 2),
      )..show(context),
    );
  }

  static snakBar(String message, BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        content: Text(message),
      ),
    );
  }

  static void fieldFocusChange(
      BuildContext context, FocusNode currentfocus, FocusNode nextfocus) {
    currentfocus.unfocus();
    FocusScope.of(context).requestFocus(nextfocus);
  }
}
