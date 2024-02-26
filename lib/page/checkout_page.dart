import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controller/cart_controller.dart';
import 'package:qr_flutter/qr_flutter.dart';

class CheckOutPage extends StatelessWidget {
  final CartController controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Checkout', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)) , centerTitle: false,),
      body: buildGridView(),
    );
  }
   Widget buildGridView() {
    return 
          Center(
            child: Column(
              children: [
                const Spacer(flex: 1),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.black,
                      width: 10, 
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: QrImageView(
                      data: 'https://payment.spw.challenge/checkout?price=${controller.totalPrice}',
                      version: QrVersions.auto,
                      size: 320,
                      gapless: false,
                    ),
                  ),
                ),
                const Spacer(flex: 1),
                 const Text('Scan & Pay',
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
                const Spacer(flex: 1),
                Text(NumberFormat.currency(locale: 'en_US', symbol: '\$', decimalDigits: controller.totalPrice.truncateToDouble() == controller.totalPrice ? 0 : 2).format(controller.totalPrice),
                    style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                const Spacer(flex: 3),
              ],
            ),
          );

  }
}