class Cart {
  final String name;
  final String imgUrl;
  final String qty;
  final int price;

  Cart({
    required this.name,
    required this.imgUrl,
    required this.qty,
    required this.price,
  });

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        name: json["name"],
        imgUrl: json["imgUrl"],
        qty: json["qty"],
        price: json['price'],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "imgUrl": imgUrl,
        "qty": qty,
        'price': price,
      };
}
