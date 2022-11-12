import 'package:flutter/cupertino.dart';
import 'package:fresh_food_ui/src/ui/auth/controllers/form_controller.dart';

class SignInController extends FormController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool hidePassword = true;
  void togglePasswordVisiblity() {
    hidePassword = !hidePassword;
    notifyListeners();
  }

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    if (super.validate()) {
      print('validated');
    } else {
      print('not validated');
    }
  }
}
