import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controller/cart_controller.dart';
import 'checkout_page.dart';

class CartPage extends StatelessWidget {
  final CartController controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cart', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)) , centerTitle: false,),
      body: Obx(() {
        if (controller.cartItems.isEmpty) {
           return const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(bottom: 10),
                              child: Icon(Icons.remove_shopping_cart, size: 150, color: Colors.grey,),
                            ),
                            Text('Your cart is empty', style: TextStyle( fontSize: 25,fontWeight: FontWeight.bold)),
                          ],
                        )
                      );
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
                        child: const Icon(Icons.delete, color: Colors.white)),
                    onDismissed: (_) => controller.removeFromCart(item),
                    child: Card(
                      child: ListTile(
                        title: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.network(
                                          item.imageUrl, 
                                          fit: BoxFit.cover,
                                          width: MediaQuery.of(context).size.width * 0.3,
                                          height: MediaQuery.of(context).size.height * 0.1,
                                        ),
                            ),
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item.name,
                                      style: const TextStyle(fontWeight: FontWeight.bold),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(NumberFormat.currency(locale: 'en_US', symbol: '\$', decimalDigits: item.price.truncateToDouble() == item.price ? 0 : 2).format(item.price * item.quantity),
                                        style: const TextStyle(fontWeight: FontWeight.bold)
                                        ),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(
                                          color: Colors.black,
                                          width: 1, 
                                        ),
                                      ),
                                      child: SizedBox(
                                        height: 40,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            IconButton(
                                              icon: const Icon(Icons.remove),
                                              onPressed: () =>
                                                  controller.decreaseQuantity(item),
                                            ),
                                        
                                            Container(
                                              decoration: const BoxDecoration(
                                              border: Border(
                                                left: BorderSide(width: 1, color: Colors.black),
                                                right: BorderSide(width: 1, color: Colors.black),
                                              ),
                                            ),
                                              child: 
                                              SizedBox(
                                                width: 50,
                                                child: Center(
                                                  child: Text(
                                                    '${item.quantity}', style: 
                                                    const TextStyle(fontWeight: FontWeight.bold)
                                                  ),
                                                ),
                                              ),
                                            ),

                                            IconButton(
                                              icon: const Icon(Icons.add),
                                              onPressed: () =>
                                                  controller.increaseQuantity(item),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
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
                  Text(NumberFormat.currency(locale: 'en_US', symbol: 'Total: \$', decimalDigits: controller.totalPrice.truncateToDouble() == controller.totalPrice ? 0 : 2).format(controller.totalPrice),
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                    ),
                    onPressed: () {
                      // Navigate to Checkout Page
                      Get.to(() => CheckOutPage());
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
