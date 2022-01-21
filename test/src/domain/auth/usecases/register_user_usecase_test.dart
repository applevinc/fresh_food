import 'package:flutter_test/flutter_test.dart';
import 'package:fresh_food_ui/src/core/error/failure.dart';
import 'package:fresh_food_ui/src/core/value_objects/identity.dart';
import 'package:fresh_food_ui/src/core/value_objects/title.dart';
import 'package:fresh_food_ui/src/domain/auth/entities/user.dart';
import 'package:fresh_food_ui/src/domain/auth/repository/I_user_auth_repository.dart';
import 'package:fresh_food_ui/src/domain/auth/usecases/register_user_usecase.dart';
import 'package:fresh_food_ui/src/domain/auth/value_objects/email.dart';
import 'package:fresh_food_ui/src/domain/auth/value_objects/password.dart';
import 'package:mocktail/mocktail.dart';
import 'package:multiple_result/multiple_result.dart';

class MockUserRepository extends Mock implements IUserAuthRepository {}

void main() {
  late RegisterUserUseCase sut;
  late MockUserRepository mockUserRepository;

  setUp(() {
    mockUserRepository = MockUserRepository();
    sut = RegisterUserUseCase(userRepository: mockUserRepository);
  });

  group('RegisterUserUseCase', () {
    var id = Identity.create('any').getSuccess();
    var name = Title.create('Abe Lenard').getSuccess();
    var email = Email.create('user@gmail.com').getSuccess();
    var password = Password.create('12345678').getSuccess();

    test('should return Failure when registration is not successful', () async {
      //arrange
      when(() => mockUserRepository.register(
              fullName: name!, email: email!, password: password!))
          .thenAnswer((_) async => Future.value(Error(Failure('err'))));

      //act
      var result = await sut.execute(fullName: name!, email: email!, password: password!);

      //assert
      expect(result.isError(), true);
      verify(() =>
          mockUserRepository.register(fullName: name, email: email, password: password));
    });

    test('should return new user when registration is successful', () async {
      //arrange
      when(() => mockUserRepository.register(
          fullName: name!, email: email!, password: password!)).thenAnswer(
        (_) async => Future.value(
          Success(
            UserEntity(
              id: id!,
              fullName: name!,
              email: email!,
              password: password!,
            ),
          ),
        ),
      );

      //act
      var result = await sut.execute(fullName: name!, email: email!, password: password!);

      //assert
      expect(result.isSuccess(), true);
      verify(() => mockUserRepository.register(
          fullName: name, email: email, password: password)).called(1);
    });
  });
}
