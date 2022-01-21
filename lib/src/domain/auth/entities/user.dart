import 'package:fresh_food_ui/src/core/value_objects/identity.dart';
import 'package:fresh_food_ui/src/core/value_objects/title.dart';
import 'package:fresh_food_ui/src/domain/auth/value_objects/email.dart';
import 'package:fresh_food_ui/src/domain/auth/value_objects/password.dart';

class UserEntity {
  Identity id;
  Title fullName;
  Email email;
  Password? password;

  UserEntity({
    required this.id,
    required this.fullName,
    required this.email,
    this.password,
  });
}
