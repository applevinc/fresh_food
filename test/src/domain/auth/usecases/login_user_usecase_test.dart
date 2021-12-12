import 'package:flutter_test/flutter_test.dart';
import 'package:fresh_food_ui/src/core/global/failure.dart';
import 'package:fresh_food_ui/src/core/value_objects/identity.dart';
import 'package:fresh_food_ui/src/core/value_objects/title.dart';
import 'package:fresh_food_ui/src/domain/auth/entities/user.dart';
import 'package:fresh_food_ui/src/domain/auth/usecases/login_user_usecase.dart';
import 'package:fresh_food_ui/src/domain/auth/value_objects/email.dart';
import 'package:fresh_food_ui/src/domain/auth/value_objects/password.dart';
import 'package:mocktail/mocktail.dart';
import 'package:multiple_result/multiple_result.dart';
import 'register_user_usecase_test.dart';

void main() {
  late LoginUserUseCase sut;
  late MockUserRepository mockUserRepository;

  setUp(() {
    mockUserRepository = MockUserRepository();
    sut = LoginUserUseCase(userRepository: mockUserRepository);
  });

  group('LoginUserUseCase', () {
    var userId = Identity.create('aaagdw161667').getSuccess();
    var name = Title.create('Abe Lenard').getSuccess();
    var email = Email.create('user@gmail.com').getSuccess();
    var password = Password.create('12345678').getSuccess();

    test('should return Failure when login is not successful', () async {
      //arrange
      when(() => mockUserRepository.login(email: email!, password: password!))
          .thenAnswer((_) async => Future.value(Error(Failure('err'))));

      //act
      var result = await sut.execute(email: email!, password: password!);

      //assert
      expect(result.isError(), true);
      verify(() => mockUserRepository.login(email: email, password: password));
    });

    test('should return User when login is successful', () async {
      //arrange
      when(() => mockUserRepository.login(email: email!, password: password!)).thenAnswer(
          (_) async => Future.value(Success(
              User(id: userId!, fullName: name!, email: email!, password: password!))));

      //act
      var result = await sut.execute(email: email!, password: password!);

      //assert
      expect(result.isSuccess(), true);
      verify(() => mockUserRepository.login(email: email, password: password));
    });
  });
}
