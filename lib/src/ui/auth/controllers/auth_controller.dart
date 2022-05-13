import 'package:flutter/cupertino.dart';

class AuthController extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  _setIsLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}
