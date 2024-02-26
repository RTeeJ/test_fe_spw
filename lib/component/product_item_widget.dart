import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../model/product.dart';
import '../page/product_page.dart';
import 'package:intl/intl.dart'; 

class ProductItemWidget extends StatelessWidget {
  final Product product;

  const ProductItemWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to product details page
        Get.to(() => ProductPage(product: product));
      },
      child: Card(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.network(
                      product.imageUrl,
                      fit: BoxFit.cover,
                      // Return widget to handle image error condition
                      errorBuilder: (BuildContext context, Object exception,
                          StackTrace? stackTrace) {
                        return const Center(
                          child: Icon(
                            Icons.image_not_supported,
                            size: 100,
                            color: Colors.grey,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                    child: Text(
                      product.name,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis, // handle long texts
                      maxLines: 1,
                    ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(NumberFormat.currency(locale: 'en_US', symbol: '\$', decimalDigits: product.price.truncateToDouble() == product.price ? 0 : 2).format(product.price),
                  style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold)
                  )
                ),
              ],
            ),
            Positioned(
              top: 5,
              right: 5,
              child: Obx(() => IconButton(
                    icon: Icon(product.isFavorite.value
                        ? Icons.favorite
                        : Icons.favorite_border),
                    color: product.isFavorite.value ? Colors.red : Colors.grey,
                    onPressed: () {
                      product.isFavorite.toggle();
                    },
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
