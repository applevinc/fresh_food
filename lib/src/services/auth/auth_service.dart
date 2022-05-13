import 'package:fresh_food_ui/src/models/user.dart';

abstract class AuthService {
  Future<void> login({
    required String email,
    required String password,
  });
  Future<void> register({required User newUser});
}
