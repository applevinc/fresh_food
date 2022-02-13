import 'package:flutter/foundation.dart';
import 'package:fresh_food_ui/src/core/value_objects/title.dart';
import 'package:fresh_food_ui/src/domain/auth/entities/user.dart';
import 'package:fresh_food_ui/src/domain/auth/usecases/login_user_usecase.dart';
import 'package:fresh_food_ui/src/domain/auth/usecases/register_user_usecase.dart';
import 'package:fresh_food_ui/src/domain/auth/value_objects/password.dart';
import 'package:fresh_food_ui/src/domain/auth/value_objects/email.dart';

class AuthViewModel extends ChangeNotifier {
  LoginUserUseCase _loginUserUseCase;
  RegisterUserUseCase _registerUserUseCase;
  List<String> _errMessages = [];

  AuthViewModel(
      {required LoginUserUseCase loginUserUseCase,
      required RegisterUserUseCase registerUserUseCase})
      : _loginUserUseCase = loginUserUseCase,
        _registerUserUseCase = registerUserUseCase;

  Future<void> register({
    required String fullName,
    required String email,
    required String password,
  }) async {
    _errMessages = [];
    var vfullName = Title.create(fullName).when((error) {
      _errMessages.add(error.message);
      return null;
    }, (success) => success);

    var vemail = Email.create(email).when((error) {
      _errMessages.add(error.message);
      return null;
    }, (success) => success);

    var vpassword = Password.create(password).when((error) {
      _errMessages.add(error.message);
      return null;
    }, (success) => success);

    if (_errMessages.isNotEmpty) throw Exception(_errMessages.join('\n'));

    var result = await _registerUserUseCase.execute(
      fullName: vfullName!,
      email: vemail!,
      password: vpassword!,
    );

    result.when((error) => throw Exception(error.message), (success) => null);
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    _errMessages = [];
    var vemail = Email.create(email).when((error) {
      _errMessages.add(error.message);
      return null;
    }, (success) => success);

    var vpassword = Password.create(password).when((error) {
      _errMessages.add(error.message);
      return null;
    }, (success) => success);

    if (_errMessages.isNotEmpty) throw Exception(_errMessages.join('\n'));

    var result = await _loginUserUseCase.execute(
      email: vemail!,
      password: vpassword!,
    );

    result.when(
      (error) => throw Exception(error.message),
      (success) => _cacheLoginDetails(user: success),
    );
  }

  void _cacheLoginDetails({required UserEntity user}) {}
}
