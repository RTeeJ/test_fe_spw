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
      appBar: AppBar(title: const Text('Saved', style: TextStyle(fontWeight: FontWeight.bold)) , centerTitle: false,),
      body: Obx(() {
        final savedProducts =
            controller.productItems.where((p) => p.isFavorite.value).toList();
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
