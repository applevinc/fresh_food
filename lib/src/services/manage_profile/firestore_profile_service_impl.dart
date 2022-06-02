import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fresh_food_ui/src/models/customer.dart';
import 'package:fresh_food_ui/src/models/datastore.dart';
import 'package:fresh_food_ui/src/models/failure.dart';
import 'package:fresh_food_ui/src/services/manage_profile/profile_service.dart';

class FireStoreProfileServiceImpl implements ProfileService {
  final _usersCollection = FirebaseFirestore.instance.collection('users');

  @override
  Future<void> createCustomer(Customer newCustomer) async {
    try {
      await _usersCollection.add(newCustomer.toJson());
      DataStore.currentCustomer = newCustomer;
    } on Exception {
      throw Failure('Failed to create user profile');
    } on Error {
      throw Failure('Failed to create user profile');
    }
  }
}
