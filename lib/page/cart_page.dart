import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/cart_controller.dart';

class CartPage extends StatelessWidget {
  final CartController controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cart', style: TextStyle(fontWeight: FontWeight.bold)) , centerTitle: false,),
      body: Obx(() {
        if (controller.cartItems.isEmpty) {
          return const Center(child: Text('Your cart is empty'));
        }
        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: controller.cartItems.length,
                itemBuilder: (context, index) {
                  final item = controller.cartItems[index];
                  return Dismissible(
                    key: UniqueKey(),
                    background: Container(
                        color: Colors.red,
                        child: Icon(Icons.delete, color: Colors.white)),
                    onDismissed: (_) => controller.removeFromCart(item),
                    child: Card(
                      child: ListTile(
                        leading: Image.network(item.imageUrl),
                        title: Text(item.name),
                        subtitle: Text('\$${item.price}'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(Icons.remove),
                              onPressed: () =>
                                  controller.decreaseQuantity(item),
                            ),
                            Text('${item.quantity}'),
                            IconButton(
                              icon: Icon(Icons.add),
                              onPressed: () =>
                                  controller.increaseQuantity(item),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total: \$${controller.totalPrice.toStringAsFixed(2)}'),
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to Checkout Page
                    },
                    child: const Text('Checkout'),
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
