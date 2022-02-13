import 'package:flutter_test/flutter_test.dart';
import 'package:fresh_food_ui/src/data/auth/repositories/fakes/fake_auth_repository.dart';
import 'package:fresh_food_ui/src/domain/auth/usecases/login_user_usecase.dart';
import 'package:fresh_food_ui/src/domain/auth/usecases/register_user_usecase.dart';
import 'package:fresh_food_ui/src/presentation/auth/auth_viewmodel.dart';
import 'package:matcher/matcher.dart' as matcher;

void main() {
  late AuthViewModel sut;
  late LoginUserUseCase loginUserUseCase;
  late RegisterUserUseCase registerUserUseCase;
  late FakeAuthRepository fakeAuthRepository;

  setUp(() {
    fakeAuthRepository = FakeAuthRepository();
    loginUserUseCase = LoginUserUseCase(authRepository: fakeAuthRepository);
    registerUserUseCase = RegisterUserUseCase(authRepository: fakeAuthRepository);
    sut = AuthViewModel(
        loginUserUseCase: loginUserUseCase, registerUserUseCase: registerUserUseCase);
  });

  group('AuthViewModel.Register', () {
    test('should throw Exception when errors with inputs', () async {
      // arrange
      var tUser = fakeAuthRepository.user;

      // assert
      expect(
          () => sut.register(
                fullName: tUser.fullName.value,
                email: tUser.email.value,
                password: 'tUser',
              ),
          throwsA(
            matcher.TypeMatcher<Exception>(),
          ));
    });
  });

  group('AuthViewModel.Login', () {
    test('should throw Exception when errors with inputs', () async {
      // arrange
      var tUser = fakeAuthRepository.user;

      // assert
      expect(
          () => sut.login(
                email: tUser.email.value,
                password: 'tUser',
              ),
          throwsA(
            matcher.TypeMatcher<Exception>(),
          ));
    });
  });
}
