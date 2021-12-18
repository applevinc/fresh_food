import 'package:flutter_test/flutter_test.dart';
import 'package:fresh_food_ui/src/core/error/failure.dart';
import 'package:fresh_food_ui/src/core/value_objects/title.dart';
import 'package:matcher/matcher.dart' as matcher;

void main() {
  group('Title', () {
    test('should return Failure when value is empty', () {
      //arrange
      var title = Title.create('').get();

      //assert
      expect(title, const matcher.TypeMatcher<Failure>());
    });

    test('should create title when value is not empty', () {
      // arrange
      String str = 'Piggey';
      var title = Title.create(str).getSuccess();

      // assert
      expect(title!.value, str);
    });
  });
}
