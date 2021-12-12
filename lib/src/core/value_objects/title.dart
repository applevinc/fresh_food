import 'package:equatable/equatable.dart';
import 'package:fresh_food_ui/src/core/global/failure.dart';
import 'package:multiple_result/multiple_result.dart';

class Title extends Equatable {
  final String value;

  const Title._(this.value);

  static Result<Failure, Title> create(String? value) {
    if (value!.isEmpty) {
      return Error(Failure('Title value cannot be empty'));
    }
    return Success(Title._(value));
  }

  @override
  List<Object> get props => [value];
}
