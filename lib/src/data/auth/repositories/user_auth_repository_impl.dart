import 'package:fresh_food_ui/src/core/error/exceptions.dart';
import 'package:fresh_food_ui/src/data/auth/datasources/I_firebaseauth_datasource.dart';
import 'package:fresh_food_ui/src/data/auth/models/user_firebase_model.dart';
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
  Future<Result<Failure, UserEntity>> register({
    required Title fullName,
    required Email email,
    required Password password,
  }) async {
    return await _getUser(() =>
        _authDatasource.register(email: email, password: password, fullName: fullName));
  }

  @override
  Future<Result<Failure, UserEntity>> login({
    required Email email,
    required Password password,
  }) async {
    return await _getUser(() => _authDatasource.login(email: email, password: password));
  }

  Future<Result<Failure, UserEntity>> _getUser(
    Future<UserFirebaseModel> Function() loginOrRegister,
  ) async {
    try {
      final user = await loginOrRegister();

      return Success(user);
    } on ServerException {
      return Error(ServerFailure('Error Occuried'));
    }
  }
}
