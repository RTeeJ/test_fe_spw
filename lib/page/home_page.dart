import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../component/product_item_widget.dart';
import '../controller/home_controller.dart';
import 'cart_page.dart';
import 'save_page.dart';

class HomePage extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('For You', style: TextStyle(fontWeight: FontWeight.bold)) , centerTitle: false,),
      body: buildGridView(),
    );
  }
   Widget buildGridView() {
    return 
        GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.8,
          ),
          itemCount: controller.productItems.length,
          itemBuilder: (context, index) {
            return ProductItemWidget(
              product: controller.productItems[index],
            );
          },
        );
  }
}