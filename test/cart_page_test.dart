
import 'package:flutter_test/flutter_test.dart';
import 'package:test_fe_spw/controller/cart_controller.dart';
import 'package:test_fe_spw/model/cart_item.dart';

void main() {
  group('CartController', () {
    test('Add to Cart', () {
      // Test add items to cart
      final cartController = CartController();

      // Create instance
      final cartItem = CartItem(
        name: 'Product 1',
        imageUrl: 'https://example.com/image1.jpg',
        price: 10.0,
        quantity: 1,
      );

      // Add item to cart
      cartController.addToCart(cartItem);

      // Assert cartItems list is not empty after adding
      expect(cartController.cartItems.isNotEmpty, true);
      // Assert length of cartItems list is 1 after adding
      expect(cartController.cartItems.length, 1);
      // Assert added item is the same as the one added
      expect(cartController.cartItems[0], cartItem);
    });

    test('Remove from Cart', () {
      // Test remove items from cart
      final cartController = CartController();

      // Create instance
      final cartItem = CartItem(
        name: 'Product 1',
        imageUrl: 'https://example.com/image1.jpg',
        price: 10.0,
        quantity: 1,
      );

      // Add item to cart
      cartController.addToCart(cartItem);

      // Remove item from cart
      cartController.removeFromCart(cartItem);

      // Assert cartItems list is empty after removing
      expect(cartController.cartItems.isEmpty, true);
    });

    test('Increase Quantity', () {
      // Test increase quantity items in cart
      final cartController = CartController();

      // Create instance
      final cartItem = CartItem(
        name: 'Product 1',
        imageUrl: 'https://example.com/image1.jpg',
        price: 10.0,
        quantity: 1,
      );

      // Add item to cart
      cartController.addToCart(cartItem);

      // Increase quantity of item
      cartController.increaseQuantity(cartItem);

      // Assert quantity of item in cart is increased
      expect(cartController.cartItems[0].quantity, 2);
    });

    test('Decrease Quantity', () {
      // Test decrease quantity of items in cart
      final cartController = CartController();

      // Create instance
      final cartItem = CartItem(
        name: 'Product 1',
        imageUrl: 'https://example.com/image1.jpg',
        price: 10.0,
        quantity: 2,
      );

      // Add item to cart
      cartController.addToCart(cartItem);

      // Decrease quantity of item
      cartController.decreaseQuantity(cartItem);

      // Assert quantity of item in cart is decreased
      expect(cartController.cartItems[0].quantity, 1);
    });
  });
}
