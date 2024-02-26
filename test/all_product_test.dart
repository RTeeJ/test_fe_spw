import 'package:flutter_test/flutter_test.dart';
import 'package:test_fe_spw/model/all_product.dart';
import 'package:test_fe_spw/model/product.dart';

void main() {
  group('AllProduct', () {
    test('Initialization', () {
      final allProduct = AllProduct();

      // Assert productItems list is empty
      expect(allProduct.productItems.isEmpty, true);

      // Manual add products to simulate
      allProduct.productItems.addAll([
        Product(
          id: 1,
          name: "Product 1",
          imageUrl: "https://example.com/image1.jpg",
          price: 10.0,
        ),
        Product(
          id: 2,
          name: "Product 2",
          imageUrl: "https://example.com/image2.jpg",
          price: 20.0,
        ),
      ]);

      // Assert productItems list is not empty after initialization
      expect(allProduct.productItems.isNotEmpty, true);
      // Assert the length of productItems list matches the number of items added
      expect(allProduct.productItems.length, 2);
      // Assert the properties of the first product match the manually added values
      expect(allProduct.productItems[0].id, 1);
      expect(allProduct.productItems[0].name, 'Product 1');
      expect(allProduct.productItems[0].imageUrl, 'https://example.com/image1.jpg');
      expect(allProduct.productItems[0].price, 10.0);
    });
  });
}