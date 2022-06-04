class Customer {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final List<RecipePref> recipePrefs;

  Customer({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.recipePrefs,
  });

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        recipePrefs: List<RecipePref>.from(
            json['recipePreferences'].map((x) => RecipePref.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "recipePreferences": recipePrefs,
      };
}

class RecipePref {
  final String title;

  RecipePref({required this.title});

  factory RecipePref.fromJson(Map<String, dynamic> json) => RecipePref(
        title: json["recipe"],
      );

  Map<String, dynamic> toJson() => {
        "recipe": title,
      };
}
