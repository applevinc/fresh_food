import 'package:flutter_test/flutter_test.dart';
import 'package:fresh_food_ui/src/core/error/failure.dart';
import 'package:fresh_food_ui/src/domain/auth/value_objects/password.dart';
import 'package:matcher/matcher.dart' as matcher;

void main() {
  group('Password', () {
    test('should return failure when value is empty', () {
      //arrange
      var password = Password.create('').get();

      //assert
      expect(password, const matcher.TypeMatcher<Failure>());
    });

    test('should return password when value is not empty', () {
      //arrange
      var str = '123456';
      var password = Password.create(str).getSuccess();

      //assert
      expect(password!.value, str);
    });

    test('should return failure when value is short', () {
      //arrange
      var str = '123';
      var password = Password.create(str).get();

      //assert
      expect(password, const matcher.TypeMatcher<Failure>());
    });

    test('should return password when value is long', () {
      //arrange
      var str = '12324242425';
      var password = Password.create(str).getSuccess();

      //assert
      expect(password!.value, str);
    });
  });
}
