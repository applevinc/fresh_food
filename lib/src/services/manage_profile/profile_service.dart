import 'package:fresh_food_ui/src/models/customer.dart';

abstract class ProfileService {
  Future<void> createCustomer(Customer newCustomer);
  Future<void> getCustomerData(String customerId);
}
