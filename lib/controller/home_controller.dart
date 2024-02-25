import 'package:get/get.dart';
import 'package:test_fe_spw/model/all_product.dart';
import '../model/product.dart';

class HomeController extends GetxService{
  final AllProduct allProduct = Get.find<AllProduct>();
  final RxList<Product> productItems = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    productItems.assignAll(allProduct.productItems);
  }
}


