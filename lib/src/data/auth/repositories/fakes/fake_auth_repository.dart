import 'package:fresh_food_ui/src/core/value_objects/identity.dart';
import 'package:fresh_food_ui/src/data/auth/models/user_firebase_model.dart';
import 'package:fresh_food_ui/src/domain/auth/entities/user.dart';
import 'package:fresh_food_ui/src/core/value_objects/title.dart';
import 'package:fresh_food_ui/src/core/error/failure.dart';
import 'package:fresh_food_ui/src/domain/auth/repository/I_user_auth_repository.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:fresh_food_ui/src/domain/auth/value_objects/password.dart';
import 'package:fresh_food_ui/src/domain/auth/value_objects/email.dart';

class FakeAuthRepository implements IAuthRepository {
  var id = Identity.create('id value').getSuccess();
  var fullName = Title.create('Appleyard Vincent').getSuccess();
  var email = Email.create('appleyardvincent@gmail.com').getSuccess();
  var password = Password.create('1234567890').getSuccess();

  late UserFirebaseModel _user;
  UserFirebaseModel get user => _user;

  FakeAuthRepository() {
    _user = UserFirebaseModel(
      id: id!,
      fullName: fullName!,
      email: email!,
      password: password!,
    );
  }

  @override
  Future<Result<Failure, UserEntity>> login({
    required Email email,
    required Password password,
  }) async {
    return Success(_user);
  }

  @override
  Future<Result<Failure, UserEntity>> register({
    required Title fullName,
    required Email email,
    required Password password,
  }) async {
    return Success(_user);
  }
}
