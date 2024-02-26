import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_fe_spw/model/all_product.dart';

import 'controller/cart_controller.dart';
import 'page/cart_page.dart';
import 'page/home_page.dart';
import 'page/save_page.dart';

void main()  async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize AllProduct() and await to completion before running the app
  await Get.putAsync(() => AllProduct().init());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
   Get.put(CartController());
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}
class MainPage extends StatefulWidget {
  const MainPage({super.key});
  @override
  State<MainPage> createState() => _MainPageState();
}
class _MainPageState extends State<MainPage> {

  // Reactive selected index
  final RxInt _selectedIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        // Return page based on current index
        switch (_selectedIndex.value) {
          case 1:
            return SavedPage();
          case 2:
            return CartPage();
          default:
            return HomePage();
        }
      }),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite), label: 'Saved'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart), label: 'Cart'),
            ],
            currentIndex: _selectedIndex.value,
            onTap: (index) {
              // Update the index on tap
              _selectedIndex.value = index;
            },
          )),
    );
  }
}