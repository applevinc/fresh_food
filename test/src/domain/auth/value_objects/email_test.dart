import 'package:flutter_test/flutter_test.dart';
import 'package:fresh_food_ui/src/core/error/failure.dart';
import 'package:fresh_food_ui/src/domain/auth/value_objects/email.dart';
import 'package:matcher/matcher.dart' as matcher;

void main() {
  group('Email', () {
    test('should return failure when value is empty', () {
      //arrange
      var email = Email.create('').get();

      //assert
      expect(email, const matcher.TypeMatcher<Failure>());
    });

    test('should return email when value is not empty', () {
      //arrange
      var str = 'user@gmail.com';
      var email = Email.create(str).getSuccess();

      //assert
      expect(email!.value, str);
    });

    test('should return failure when value is invalid', () {
      //arrange
      var str = 'usergmail.com';
      var email = Email.create(str).get();

      //assert
      expect(email, const matcher.TypeMatcher<Failure>());
    });

    test('should return email when value is valid', () {
      //arrange
      var str = 'user@gmail.com';
      var email = Email.create(str).getSuccess();

      //assert
      expect(email!.value, str);
    });
  });
}
