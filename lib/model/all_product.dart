import 'package:get/get.dart';
import 'package:test_fe_spw/model/product.dart';

class AllProduct extends GetxService {
  final RxList<Product> productItems = <Product>[].obs;

  Future<AllProduct> init() async {
    List<Map<String, dynamic>> productDataList = [
      {
        "product_items": [
          {
            "id": 1,
            "name": "Puma White (New)",
            "image_url":
                "https://images.unsplash.com/photo-1608231387042-66d1773070a5?fit=crop&w=300&q=80",
            "price": 250.00
          },
          {
            "id": 2,
            "name": "iPhone 12 Pro Black Edition",
            "image_url":
                "https://images.unsplash.com/photo-1573148195900-7845dcb9b127?fit=crop&w=300&q=80",
            "price": 1200.00
          },
          {
            "id": 3,
            "name": "Nintendo Switch 2021",
            "image_url":
                "https://images.unsplash.com/photo-1578303512597-81e6cc155b3e?fit=crop&w=300&q=80",
            "price": 599.00
          },
          {
            "id": 4,
            "name": "Black + Decker",
            "image_url":
                "https://images.unsplash.com/photo-1574269909862-7e1d70bb8078?fit=crop&w=300&q=80",
            "price": 149.00
          },
          {
            "id": 5,
            "name": "White Neat Mug",
            "image_url":
                "https://images.unsplash.com/photo-1514228742587-6b1558fcca3d?fit=crop&w=300&q=80",
            "price": 35.00
          },
          {
            "id": 6,
            "name": "SMEG Oven - Winter Collection",
            "image_url":
                "https://images.unsplash.com/photo-1586208958839-06c17cacdf08?fit=crop&w=300&q=80",
            "price": 8299.00
          },
          {
            "id": 7,
            "name": "Black Table Fan with Pink Moody Cat",
            "image_url":
                "https://images.unsplash.com/photo-1618941716939-553df3c6c278?fit=crop&w=300&q=80",
            "price": 79.00
          }
        ]
      }
    ];

    List<Product> products = productDataList
    .expand((element) => element['product_items'])
    .map<Product>((data) => Product.fromJson(data))
    .toList();
    productItems.addAll(products);
    return this;
  }
}