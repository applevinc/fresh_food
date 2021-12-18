import 'package:fresh_food_ui/src/core/error/exceptions.dart';
import 'package:fresh_food_ui/src/data/auth/datasources/I_firebaseauth_datasource.dart';
import 'package:fresh_food_ui/src/domain/auth/entities/user.dart';
import 'package:fresh_food_ui/src/core/value_objects/title.dart';
import 'package:fresh_food_ui/src/core/error/failure.dart';
import 'package:fresh_food_ui/src/domain/auth/repository/I_user_auth_repository.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:fresh_food_ui/src/domain/auth/value_objects/password.dart';
import 'package:fresh_food_ui/src/domain/auth/value_objects/email.dart';

class UserAuthRepositoryImpl implements IUserAuthRepository {
  final IFirebaseAuthDatasource _authDatasource;

  UserAuthRepositoryImpl({required IFirebaseAuthDatasource authDatasource})
      : this._authDatasource = authDatasource;

  @override
  Future<Result<Failure, User>> register({
    required Title fullName,
    required Email email,
    required Password password,
  }) async {
    try {
      final user = await _authDatasource.register(
        fullName: fullName,
        email: email,
        password: password,
      );

      return Success(user);
    } on ServerException {
      return Error(ServerFailure('Error Occuried'));
    }
  }

  @override
  Future<Result<Failure, User>> login({
    required Email email,
    required Password password,
  }) async {
    try {
      final user = await _authDatasource.login(
        email: email,
        password: password,
      );

      return Success(user);
    } on ServerException {
      return Error(ServerFailure('Error Occuried'));
    }
  }
}
