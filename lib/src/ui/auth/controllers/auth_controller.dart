import 'package:flutter/cupertino.dart';
import 'package:fresh_food_ui/src/models/customer.dart';
import 'package:fresh_food_ui/src/models/failure.dart';
import 'package:fresh_food_ui/src/services/auth/auth_service.dart';
import 'package:fresh_food_ui/src/services/manage_profile/profile_service.dart';

class AuthController extends ChangeNotifier {
  late final AuthService _authService;
  late final ProfileService _profileService;

  AuthController({
    required AuthService authService,
    required ProfileService profileService,
  })  : _authService = authService,
        _profileService = profileService;

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  _setIsLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    try {
      _setIsLoading(true);
      final userId = await _authService.signIn(
        email: email,
        password: password,
      );

      if (userId != null) {
        await _profileService.getCustomerData(userId);
        _setIsLoading(false);
      }
      _setIsLoading(false);
    } on Failure {
      _setIsLoading(false);
      rethrow;
    }
  }

  Future<void> register({
    required Customer newCustomer,
    required String password,
  }) async {
    try {
      _setIsLoading(true);
      final customer = await _authService.register(
        newCustomer: newCustomer,
        password: password,
      );

      if (customer != null) {
        await _profileService.createCustomer(customer);
      }
      _setIsLoading(false);
    } on Failure {
      _setIsLoading(false);
      rethrow;
    }
  }
}
