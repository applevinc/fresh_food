import 'package:firebase_auth/firebase_auth.dart';
import 'package:fresh_food_ui/src/models/customer.dart';
import 'package:fresh_food_ui/src/models/failure.dart';
import 'package:fresh_food_ui/src/services/auth/auth_service.dart';

class FirebaseAuthServiceImpl implements AuthService {
  final _auth = FirebaseAuth.instance;

  @override
  Future<String?> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = userCredential.user;

      if (user != null) {
        return user.uid;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw Failure('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        throw Failure('Wrong password provided for that user.');
      }
    }
    return null;
  }

  @override
  Future<Customer?> register({
    required Customer newCustomer,
    required String password,
  }) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: newCustomer.email,
        password: password,
      );
      final user = userCredential.user;

      if (user != null) {
        return Customer(
          id: user.uid,
          firstName: newCustomer.firstName,
          lastName: newCustomer.lastName,
          email: newCustomer.email,
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw Failure('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw Failure('The account already exists for that email.');
      }
    }
    return null;
  }
}
