import 'package:get/get.dart';
import '../model/cart_item.dart';

class CartController extends GetxController {
  var cartItems = <CartItem>[].obs;

  double get totalPrice =>
      cartItems.fold(0, (sum, item) => sum + item.price * item.quantity);

  void addToCart(CartItem item) {
    // print('Adding item to cart: $item');
    var existingItem =
        cartItems.firstWhereOrNull((cartItem) => cartItem.name == item.name);
    if (existingItem != null) {
      existingItem.quantity++;
    } else {
      // print('Item not found in cart, adding new item: $item');
      cartItems.add(item);
    }
    // print('Cart items after adding: $cartItems');
    cartItems.refresh();
  }

  void removeFromCart(CartItem item) {
    cartItems.remove(item);
    cartItems.refresh();
  }

  void increaseQuantity(CartItem item) {
    item.quantity++;
    cartItems.refresh();
  }

  void decreaseQuantity(CartItem item) {
    if (item.quantity >= 1) {
      item.quantity--;
      cartItems.refresh();
    } if (item.quantity == 0) {  // when item qty reach zero then remove it from cart
      cartItems.remove(item);
      cartItems.refresh();
    }
  }
}
