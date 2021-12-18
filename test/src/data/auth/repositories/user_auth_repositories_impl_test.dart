import 'package:flutter_test/flutter_test.dart';
import 'package:fresh_food_ui/src/core/error/exceptions.dart';
import 'package:fresh_food_ui/src/core/value_objects/identity.dart';
import 'package:fresh_food_ui/src/core/value_objects/title.dart';
import 'package:fresh_food_ui/src/data/auth/datasources/I_firebaseauth_datasource.dart';
import 'package:fresh_food_ui/src/data/auth/models/user_firebase_model.dart';
import 'package:fresh_food_ui/src/data/auth/repositories/user_auth_repository_impl.dart';
import 'package:fresh_food_ui/src/domain/auth/entities/user.dart';
import 'package:fresh_food_ui/src/domain/auth/value_objects/email.dart';
import 'package:fresh_food_ui/src/domain/auth/value_objects/password.dart';
import 'package:mocktail/mocktail.dart';

class MockFirebaseAuthDatasource extends Mock implements IFirebaseAuthDatasource {}

void main() {
  late UserAuthRepositoryImpl sut;
  late MockFirebaseAuthDatasource mockFirebaseAuthDatasource;

  setUp(() {
    mockFirebaseAuthDatasource = MockFirebaseAuthDatasource();
    sut = UserAuthRepositoryImpl(
      authDatasource: mockFirebaseAuthDatasource,
    );
  });

  group('UserAuthRepositoryImpl', () {
    final id = Identity.create('value').getSuccess();
    final fullName = Title.create('Appleyard Vincent').getSuccess();
    final email = Email.create('appleyardvincent@gmail.com').getSuccess();
    final password = Password.create('1234567890').getSuccess();

    final tUserModel = UserFirebaseModel(
      id: id!,
      fullName: fullName!,
      email: email!,
      password: password!,
    );
    final User tUser = tUserModel;

    group('Register', () {
      test('should return User when registration is successful', () async {
        // arrange
        when(() => mockFirebaseAuthDatasource.register(
            fullName: fullName,
            email: email,
            password: password)).thenAnswer((_) async => tUserModel);

        // act
        final result = await sut.register(
          fullName: fullName,
          email: email,
          password: password,
        );

        // assert
        verify(() => mockFirebaseAuthDatasource.register(
            fullName: fullName, email: email, password: password));
        expect(result.isSuccess(), true);
      });

      test('should throw ServerException when registration is not successful', () async {
        // arrange
        when(() => mockFirebaseAuthDatasource.register(
            fullName: fullName,
            email: email,
            password: password)).thenThrow(ServerException());

        // act
        final result = await sut.register(
          fullName: fullName,
          email: email,
          password: password,
        );

        // assert
        verify(() => mockFirebaseAuthDatasource.register(
            fullName: fullName, email: email, password: password));
        expect(result.isError(), true);
      });
    });
    group('Login', () {
      test('should return User when login is successful', () async {
        // arrange
        when(() => mockFirebaseAuthDatasource.login(email: email, password: password))
            .thenAnswer((_) async => tUserModel);

        // act
        final result = await sut.login(
          email: email,
          password: password,
        );

        // assert
        verify(() => mockFirebaseAuthDatasource.login(email: email, password: password));
        expect(result.isSuccess(), true);
      });

      test('should throw ServerException when login is not successful', () async {
        // arrange
        when(() => mockFirebaseAuthDatasource.login(email: email, password: password))
            .thenThrow(ServerException());

        // act
        final result = await sut.login(
          email: email,
          password: password,
        );

        // assert
        verify(() => mockFirebaseAuthDatasource.login(email: email, password: password));
        expect(result.isError(), true);
      });
    });
  });
}
