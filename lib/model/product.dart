import 'package:get/get.dart';

class Product {
  final int id;
  final String name;
  final String imageUrl;
  final double price;
  RxBool isFavorite;

  Product({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
    bool isFavorite = false,
  }) : isFavorite = RxBool(isFavorite);

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? 'Unknown',
      imageUrl: json['image_url'] as String? ?? '',
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      isFavorite: json['is_favorite'] as bool? ??
          false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image_url': imageUrl,
      'price': price,
      'is_favorite': isFavorite.value,
    };
  }
}
