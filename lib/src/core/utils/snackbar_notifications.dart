import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationMessages {
  static showSuccess(
    String message, {
    Duration duration = const Duration(seconds: 3),
  }) {
    Get.snackbar(
      "Success",
      message,
      backgroundColor: Colors.green.withOpacity(.4),
      duration: duration,
    );
  }

  static showError(
    String message, {
    Duration duration = const Duration(seconds: 5),
  }) {
    Get.snackbar(
      "Error",
      message,
      backgroundColor: Colors.red.withOpacity(.4),
      duration: duration,
    );
  }
}
