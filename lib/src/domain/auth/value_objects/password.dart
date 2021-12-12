import 'package:equatable/equatable.dart';
import 'package:fresh_food_ui/src/core/global/failure.dart';
import 'package:multiple_result/multiple_result.dart';

class Password extends Equatable {
  final String value;

  const Password._(this.value);

  static Result<Failure, Password> create(String? value) {
    if (value!.isEmpty) {
      return Error(Failure('Password cannot be empty'));
    } else if (value.length < 6) {
      return Error(Failure('Password is too short'));
    }

    return Success(Password._(value));
  }

  @override
  List<Object> get props => [value];
}
