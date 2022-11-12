import 'package:flutter/material.dart';

class FormController extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  void setIsLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool validate() {
    final form = formKey.currentState;
    if (form != null) {
      if (form.validate()) {
        form.save();
        return true;
      }
    }
    return false;
  }
}
