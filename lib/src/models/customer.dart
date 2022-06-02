class Customer {
  final String id;
  final String firstName;
  final String lastName;
  final String email;

  Customer({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
  });

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
      };
}
