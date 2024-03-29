// ignore: file_names
class MainDishModel {
  final String? imageUrl;
  final List? ingredients;
  final String? name;
  final int? price;
  final String? type;
  final String? description;
  MainDishModel({
    this.imageUrl,
    this.ingredients,
    this.name,
    this.price,
    this.type,
    this.description,
  });

  factory MainDishModel.fromJson(Map<String, dynamic> json) {
    return MainDishModel(
      imageUrl: json['imageUrl'],
      ingredients: json['ingredients'],
      name: json['name'],
      price: json['price'],
      type: json['type'],
      description: json['description'],
    );
  }
}
