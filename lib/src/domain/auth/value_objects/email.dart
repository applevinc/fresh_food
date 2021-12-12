import 'package:equatable/equatable.dart';
import 'package:fresh_food_ui/src/core/global/failure.dart';
import 'package:multiple_result/multiple_result.dart';

class Email extends Equatable {
  final String value;

  const Email._(this.value);

  static Result<Failure, Email> create(String? value) {
    if (value!.isEmpty) {
      return Error(Failure('Email value cannot be empty'));
    } else if (!value.contains('@')) {
      return Error(Failure('Invalid email address'));
    }

    return Success(Email._(value));
  }

  @override
  List<Object> get props => [value];
}
