import 'package:get/get.dart';
import 'package:test_fe_spw/model/all_product.dart';
import '../model/product.dart';

class HomeController extends GetxService{
  // Use Get.find to find an instance of AllProduct
  final AllProduct allProduct = Get.find<AllProduct>();

  // Use RxList<Product> to observe changes on products
  final RxList<Product> productItems = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Fetch product items and add them to productItems
    productItems.assignAll(allProduct.productItems);
  }
}


