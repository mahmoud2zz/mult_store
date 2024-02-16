
import 'package:flutter/material.dart';

import '../minor_screens/sub_categ_products.dart';
import '../widget/appber_widgets.dart';

class CustomerOrder extends StatelessWidget {
  const CustomerOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: AppBerTitle(title: 'CustomerOrder'),
        leading:  AppBeckButton(),
      ),
    );
  }
}
