
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:uuid/uuid.dart';


class Common{

  static String getSessionID() {
    var uuid = const Uuid();
    var timeStampInMS = DateTime.now().millisecondsSinceEpoch;
    var threeDigitRandomNumber = getThreeDigitRandomNumber();

    return uuid.v1().toString() +
        "_" +
        timeStampInMS.toString() +
        "_" +
        threeDigitRandomNumber.toString();
  }


  static int getThreeDigitRandomNumber() {
    var min = 100;
    var max = 1000;
    Random random = Random();

    var randomNumber = min + random.nextInt(max - min);
    return randomNumber;
  }


  static showLongToastWithColor(String msg, {bool isSuccess = true}) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: WidgetsBinding.instance.window.viewInsets.bottom > 0.0
            ? ToastGravity.CENTER
            : ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}