import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_fe_spw/component/product_item_widget.dart';
import 'package:test_fe_spw/controller/home_controller.dart';
import 'package:test_fe_spw/model/product.dart';
import 'package:test_fe_spw/page/save_page.dart';

void main() {
  group('SavedPage Widget', () {
    testWidgets('Empty Saved Page', (WidgetTester tester) async {
      // Initialize HomeController
      final homeController = HomeController();
      homeController.productItems.value = [];

      // Build SavedPage widget
      await tester.pumpWidget(MaterialApp(home: SavedPage()));

      // Verify text is displayed
      expect(find.text('No favourites yet'), findsOneWidget);
    });

    testWidgets('Non-empty Saved Page', (WidgetTester tester) async {
      // Initialize HomeController
      final homeController = HomeController();
      homeController.productItems.value = [
        Product(id: 1, name: 'Product 1', imageUrl: 'image1.jpg', price: 10.0, isFavorite: true),
        Product(id: 2, name: 'Product 2', imageUrl: 'image2.jpg', price: 20.0, isFavorite: false),
      ];

      // Build SavedPage widget
      await tester.pumpWidget(MaterialApp(home: SavedPage()));

      // Verify text is not displayed
      expect(find.text('No favourites yet'), findsNothing);
      // Verify correct number of products is displayed (case 2)
      expect(find.byType(ProductItemWidget), findsNWidgets(2));
    });
  });
}
