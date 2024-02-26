import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:test_fe_spw/component/common_styles.dart';

import '../component/component_styles.dart';
import '../controller/cart_controller.dart';
import 'checkout_page.dart';

class CartPage extends StatelessWidget {
  final CartController controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cart', style: ComponentStyles.appBarTitleStyle), centerTitle: false),
      body: Obx(() {
        if (controller.cartItems.isEmpty) {
           return const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: CommonStyles.padding_bottom_10,
                              child: Icon(Icons.remove_shopping_cart, size: 150, color: Colors.grey,),
                            ),
                            Text('Your cart is empty', style: ComponentStyles.noItemTextStyle),
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
                  // slide to delete
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
                              borderRadius: CommonStyles.border_radius_8,
                              child: Image.network(
                                          item.imageUrl, 
                                          fit: BoxFit.cover,
                                          width: MediaQuery.of(context).size.width * 0.3,
                                          height: MediaQuery.of(context).size.height * 0.1,
                                        ),
                            ),
                            Flexible(
                              child: Padding(
                                padding: CommonStyles.padding_left_16,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item.name,
                                      style: CommonStyles.textBoldStyle,
                                      overflow: TextOverflow.ellipsis, // handle long texts
                                    ),
                                    Text(NumberFormat.currency(locale: 'en_US', symbol: '\$', decimalDigits: item.price.truncateToDouble() == item.price ? 0 : 2).format(item.price * item.quantity),
                                        style: CommonStyles.textBoldStyle
                                        ),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: CommonStyles.border_radius_6,
                                        border: CommonStyles.border_width_1,
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
                                                    '${item.quantity}', style: CommonStyles.textBoldStyle
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
              padding: CommonStyles.padding_all_16,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(NumberFormat.currency(locale: 'en_US', symbol: 'Total: \$', decimalDigits: controller.totalPrice.truncateToDouble() == controller.totalPrice ? 0 : 2).format(controller.totalPrice),
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                                borderRadius: CommonStyles.border_radius_6,
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
