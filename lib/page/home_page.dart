import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../component/component_styles.dart';
import '../component/product_item_widget.dart';
import '../controller/home_controller.dart';
import '../model/product.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController controller = Get.put(HomeController());
  TextEditingController _searchTextController = TextEditingController();
  late String filter;

  // arrange asc by price
  void arrangeProduct() {
    setState(() {
      controller.productItems.sort((a, b) => a.price.compareTo(b.price));
    });
  }

  @override
  void initState() {
    super.initState();
    _searchTextController.addListener(() {
      // print(_searchTextController.text);
      filter = _searchTextController.text;
      setState(() {});
    });
  }

  @override
  void dispose() {
    _searchTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('For You', style: ComponentStyles.appBarTitleStyle),
          centerTitle: false),
      body: buildGridView(),
      floatingActionButton: FloatingActionButton(
        onPressed: arrangeProduct,
        child: const Icon(Icons.navigation),
      ),
    );
  }

  Widget buildGridView() {
    // filter product by product name
    List<Product> filteredProducts = controller.productItems.where((product) {
      return product.name
          .toLowerCase()
          .contains(_searchTextController.text.toLowerCase());
    }).toList();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: _searchTextController,
            decoration: const InputDecoration(
              suffixIcon: Icon(
                Icons.search,
                color: Colors.black,
                size: 20.0,
              ),
              border: InputBorder.none,
              hintText: 'Cerca la maison',
            ),
          ),
        ),
        Expanded(
          // render product by product name
          child: _searchTextController.text.isNotEmpty 
              ? GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.8,
                  ),
                  itemCount: filteredProducts.length,
                  itemBuilder: (context, index) {
                    return ProductItemWidget(
                      product: filteredProducts[index],
                    );
                  },
                ) // else
              : GridView.builder(
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
                ),
        ),
      ],
    );
  }
}
