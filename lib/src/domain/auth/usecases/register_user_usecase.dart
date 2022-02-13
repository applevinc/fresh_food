import 'package:fresh_food_ui/src/core/error/failure.dart';
import 'package:fresh_food_ui/src/core/value_objects/title.dart';
import 'package:fresh_food_ui/src/domain/auth/entities/user.dart';
import 'package:fresh_food_ui/src/domain/auth/repository/I_user_auth_repository.dart';
import 'package:fresh_food_ui/src/domain/auth/value_objects/email.dart';
import 'package:fresh_food_ui/src/domain/auth/value_objects/password.dart';
import 'package:multiple_result/multiple_result.dart';

class RegisterUserUseCase {
  final IAuthRepository _authRepository;

  RegisterUserUseCase({required IAuthRepository authRepository})
      : _authRepository = authRepository;

  Future<Result<Failure, UserEntity>> execute({
    required Title fullName,
    required Email email,
    required Password password,
  }) async {
    return await _authRepository.register(
      fullName: fullName,
      email: email,
      password: password,
    );
  }
}
