import 'package:fresh_food_ui/src/core/error/failure.dart';
import 'package:fresh_food_ui/src/domain/auth/entities/user.dart';
import 'package:fresh_food_ui/src/domain/auth/repository/I_user_auth_repository.dart';
import 'package:fresh_food_ui/src/domain/auth/value_objects/email.dart';
import 'package:fresh_food_ui/src/domain/auth/value_objects/password.dart';
import 'package:multiple_result/multiple_result.dart';

class LoginUserUseCase {
  final IAuthRepository _authRepository;

  LoginUserUseCase({required IAuthRepository authRepository})
      : _authRepository = authRepository;

  Future<Result<Failure, UserEntity>> execute({
    required Email email,
    required Password password,
  }) async {
    return await _authRepository.login(
      email: email,
      password: password,
    );
  }
}
