import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

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
        // title: const Text('Product Details'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Get.back(),
        ),
      ),
      body: 
      Column(
        children: [
          Padding(
            padding: const EdgeInsets.only( left: 16, right: 16),
            child: ClipRRect(
               borderRadius: BorderRadius.circular(6),
              child: Image.network(
                product.imageUrl,
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.height * 0.4,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.name,
                            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                            softWrap: true, // Allow text to wrap to the next line if needed
                          ),
                        ],
                      ),
                    ),
      
                    Obx(() => IconButton(
                      icon: Icon(
                        product.isFavorite.value ? Icons.favorite : Icons.favorite_border,
                      ),
                      color: product.isFavorite.value ? Colors.red : Colors.grey,
                      onPressed: () {
                        product.isFavorite.toggle(); // Toggle the value of isFavorite
                      },
                    )),
                  ],
                ),

                Text(NumberFormat.currency(locale: 'en_US', symbol: '\$', decimalDigits: product.price.truncateToDouble() == product.price ? 0 : 2).format(product.price),
                  style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.red)),
                
              ],
            ),
          ),

          const Spacer(flex:  4),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
                    child: SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 1,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                        ),
                        onPressed: () {
                          CartItem cartItem = CartItem(
                            name: product.name,
                            imageUrl: product.imageUrl,
                            price: product.price,
                            quantity: 1,
                          );
                      
                          cartController.addToCart(cartItem);
                      
                          Navigator.of(context).pop();
                      
                          Get.snackbar(
                              'Cart', // snackbar title
                              '${product.name} added to cart successfully!', // snackbar message
                          );
                        },
                        child: const Text('Add to Cart', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
          ),

          const Spacer(flex:  1),

        ]
      ),
    );
  }
}
