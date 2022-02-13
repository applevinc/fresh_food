import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fresh_food_ui/src/core/error/exceptions.dart';
import 'package:fresh_food_ui/src/core/error/failure.dart';
import 'package:fresh_food_ui/src/core/value_objects/identity.dart';
import 'package:fresh_food_ui/src/core/value_objects/title.dart';
import 'package:fresh_food_ui/src/data/auth/datasources/I_firebaseauth_datasource.dart';
import 'package:fresh_food_ui/src/domain/auth/value_objects/password.dart';
import 'package:fresh_food_ui/src/domain/auth/value_objects/email.dart';
import 'package:fresh_food_ui/src/data/auth/models/user_firebase_model.dart';

final usersRef = FirebaseFirestore.instance.collection('users');
final timeStamp = DateTime.now();

class FirebaseAuthDatasource implements IFirebaseAuthDatasource {
  final FirebaseAuth _auth;

  FirebaseAuthDatasource({required FirebaseAuth auth}) : _auth = auth;

  @override
  Future<UserFirebaseModel> login({
    required Email email,
    required Password password,
  }) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.value,
        password: password.value,
      );
      final user = userCredential.user;

      return _getUserFromFirestore(user!);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw ServerFailure('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        throw ServerFailure('Wrong password provided for that user.');
      } else if (e.code == 'invalid-email') {
        throw ServerFailure('Email address not valid');
      } else if (e.code == 'user-disabled') {
        throw ServerFailure('User corresponding to the given email has been disabled');
      } else {
        throw ServerFailure('An error occuried');
      }
    }
  }

  @override
  Future<UserFirebaseModel> register({
    required Title fullName,
    required Email email,
    required Password password,
  }) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email.value,
        password: password.value,
      );

      return _createUserInFirestore(newUser: userCredential.user!, name: fullName.value);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw Exception('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw Exception('The account already exists for that email.');
      } else if (e.code == 'invalid-email') {
        throw Exception('Email address not valid');
      } else {
        throw Exception('An error occuried');
      }
    }
  }

  UserFirebaseModel _createUserInFirestore({
    required User newUser,
    required String name,
  }) {
    usersRef.doc(newUser.uid).set({
      "id": newUser.uid,
      "fullName": name,
      "email": newUser.email,
      "timeStamp": timeStamp
    });

    return UserFirebaseModel(
      id: Identity.create(newUser.uid).getSuccess()!,
      fullName: Title.create(name).getSuccess()!,
      email: Email.create(newUser.email).getSuccess()!,
    );
  }

  Future<UserFirebaseModel> _getUserFromFirestore(User user) async {
    final doc = await usersRef.doc(user.uid).get();
    return UserFirebaseModel.fromJson(doc.data()!);
  }
}
