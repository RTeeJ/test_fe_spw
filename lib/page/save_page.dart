import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../component/product_item_widget.dart';
import '../controller/home_controller.dart';

class SavedPage extends StatelessWidget {
  final HomeController controller =
      Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Saved', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)) , centerTitle: false,),
      body: Obx(() {

        final savedProducts =
            controller.productItems.where((product) => product.isFavorite.value).toList();

        if (savedProducts.isEmpty) {
          return const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(bottom: 10),
                              child: Icon(Icons.favorite_border, size: 150, color: Colors.grey,),
                            ),
                            Text('No favourites yet', style: TextStyle( fontSize: 25,fontWeight: FontWeight.bold)),
                          ],
                        ),
                      );
        }
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.8,
          ),
          itemCount: savedProducts.length,
          itemBuilder: (context, index) {
            return ProductItemWidget(
              product: savedProducts[index],
            );
          },
        );
      }),
    );
  }
}
