import 'package:fresh_food_ui/src/core/value_objects/identity.dart';
import 'package:fresh_food_ui/src/core/value_objects/title.dart';
import 'package:fresh_food_ui/src/domain/auth/entities/user.dart';
import 'package:fresh_food_ui/src/domain/auth/value_objects/email.dart';
import 'package:fresh_food_ui/src/domain/auth/value_objects/password.dart';

class UserFirebaseModel extends User {
  UserFirebaseModel({
    required Identity id,
    required Title fullName,
    required Email email,
    required Password password,
  }) : super(
          id: id,
          fullName: fullName,
          email: email,
          password: password,
        );

  factory UserFirebaseModel.fromJson(Map<String, dynamic> json) {
    return UserFirebaseModel(
      id: json['id'],
      fullName: json['fullName'],
      email: json['email'],
      password: json['password'],
    );
  }

  // factory UserFirebaseModel.fromFirestore(DocumentSnapshot doc) {
  //   final user = UserFirebaseModel.fromJson(doc.data());
  //   return user;
  // }
}
