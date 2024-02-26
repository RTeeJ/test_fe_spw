import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:test_fe_spw/component/common_styles.dart';

import '../component/component_styles.dart';
import '../controller/cart_controller.dart';
import 'package:qr_flutter/qr_flutter.dart';

class CheckOutPage extends StatelessWidget {
  final CartController controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Checkout', style: ComponentStyles.appBarTitleStyle), centerTitle: false),
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
                    borderRadius: CommonStyles.border_radius_8,
                    border: CommonStyles.border_width_10,
                  ),
                  child: Padding(
                    padding: CommonStyles.padding_all_16,
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
                    style: ComponentStyles.scanAndPayTextStyle),
                const Spacer(flex: 1),
                Text(NumberFormat.currency(locale: 'en_US', symbol: '\$', decimalDigits: controller.totalPrice.truncateToDouble() == controller.totalPrice ? 0 : 2).format(controller.totalPrice),
                    style: ComponentStyles.appBarTitleStyle),
                const Spacer(flex: 3),
              ],
            ),
          );

  }
}