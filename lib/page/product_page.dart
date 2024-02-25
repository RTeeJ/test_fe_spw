import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/cart_controller.dart';
import '../model/cart_item.dart';
import '../model/product.dart';

class ProductPage extends StatelessWidget {
  final Product product;
  final CartController cartController = Get.find<CartController>();

  ProductPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: Column(
        children: [
          Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height * 0.4,
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  '\$${product.price}',
                  style: const TextStyle(fontSize: 20, color: Colors.red),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    CartItem cartItem = CartItem(
                      name: product.name,
                      imageUrl: product.imageUrl,
                      price: product.price,
                      quantity: 1,
                    );

                    cartController.addToCart(cartItem);

                    // Get.snackbar(
                    //     'Cart', '${product.name} added to cart successfully!');
                  },
                  child: Text('Add to Cart'),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          product.isFavorite.toggle();
          // String message =
          //     product.isFavorite.value ? 'Product saved!' : 'Product unsaved!';
          // Get.snackbar('Favorite', message);
        },
        backgroundColor: Colors.red,
        child: Obx(() => Icon(
              product.isFavorite.value ? Icons.favorite : Icons.favorite_border,
              color: Colors.white,
            )),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
    );
  }
}
