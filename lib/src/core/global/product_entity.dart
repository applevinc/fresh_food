class ProductEntity {
  final String? name;
  final String? img;
  final String? description;
  final String? storage;
  final String? origin;
  final String? preparationAndUsage;
  final Map<String, String>? nutritionInfo;

  ProductEntity({
    this.name,
    this.img,
    this.description,
    this.storage,
    this.origin,
    this.preparationAndUsage,
    this.nutritionInfo,
  });
}
