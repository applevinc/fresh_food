import 'package:fresh_food_ui/src/core/error/failure.dart';
import 'package:fresh_food_ui/src/domain/auth/entities/user.dart';
import 'package:fresh_food_ui/src/domain/auth/repository/I_user_auth_repository.dart';
import 'package:fresh_food_ui/src/domain/auth/value_objects/email.dart';
import 'package:fresh_food_ui/src/domain/auth/value_objects/password.dart';
import 'package:multiple_result/multiple_result.dart';

class LoginUserUseCase {
  final IUserAuthRepository _userRepository;

  LoginUserUseCase({required IUserAuthRepository userRepository})
      : _userRepository = userRepository;

  Future<Result<Failure, User>> execute({
    required Email email,
    required Password password,
  }) async {
    return await _userRepository.login(
      email: email,
      password: password,
    );
  }
}
