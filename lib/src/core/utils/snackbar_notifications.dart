import 'package:flutter/material.dart';
import 'package:fresh_food_ui/src/core/helpers/extensons.dart';
import 'package:get/get.dart';

class NotificationMessages {
  static showSuccess(
    String message, {
    Duration duration = const Duration(seconds: 3),
  }) {
    Get.snackbar(
      "Success",
      message.toTitleCase(),
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
      message.toTitleCase(),
      backgroundColor: Colors.red.withOpacity(.4),
      duration: duration,
    );
  }
}
