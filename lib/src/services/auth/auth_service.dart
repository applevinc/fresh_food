import 'package:fresh_food_ui/src/models/customer.dart';

abstract class AuthService {
  Future<String?> signIn({
    required String email,
    required String password,
  });
  Future<Customer?> register({
    required Customer newCustomer,
    required String password,
  });
}
