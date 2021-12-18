import 'package:equatable/equatable.dart';
import 'package:fresh_food_ui/src/core/error/failure.dart';
import 'package:multiple_result/multiple_result.dart';

class Identity extends Equatable {
  final String value;

  Identity._(this.value);

  static Result<Failure, Identity> create(String? value) {
    if (value!.isEmpty) {
      return Error(Failure('Id value cannot be empty'));
    }
    return Success(Identity._(value));
  }

  @override
  List<Object> get props => [value];
}
