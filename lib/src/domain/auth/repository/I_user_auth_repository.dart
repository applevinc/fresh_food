import 'package:fresh_food_ui/src/core/error/failure.dart';
import 'package:fresh_food_ui/src/core/value_objects/title.dart';
import 'package:fresh_food_ui/src/domain/auth/entities/user.dart';
import 'package:fresh_food_ui/src/domain/auth/value_objects/email.dart';
import 'package:fresh_food_ui/src/domain/auth/value_objects/password.dart';
import 'package:multiple_result/multiple_result.dart';

abstract class IUserAuthRepository {
  Future<Result<Failure, UserEntity>> register({
    required Title fullName,
    required Email email,
    required Password password,
  });

  Future<Result<Failure, UserEntity>> login({
    required Email email,
    required Password password,
  });
}
