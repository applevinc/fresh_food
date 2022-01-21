import 'package:fresh_food_ui/src/core/error/failure.dart';
import 'package:fresh_food_ui/src/core/value_objects/title.dart';
import 'package:fresh_food_ui/src/domain/auth/entities/user.dart';
import 'package:fresh_food_ui/src/domain/auth/repository/I_user_auth_repository.dart';
import 'package:fresh_food_ui/src/domain/auth/value_objects/email.dart';
import 'package:fresh_food_ui/src/domain/auth/value_objects/password.dart';
import 'package:multiple_result/multiple_result.dart';

class RegisterUserUseCase {
  final IUserAuthRepository _userRepository;

  RegisterUserUseCase({required IUserAuthRepository userRepository})
      : _userRepository = userRepository;

  Future<Result<Failure, UserEntity>> execute({
    required Title fullName,
    required Email email,
    required Password password,
  }) async {
    return await _userRepository.register(
      fullName: fullName,
      email: email,
      password: password,
    );
  }
}
