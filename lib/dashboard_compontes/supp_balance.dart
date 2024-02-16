import 'package:flutter/material.dart';

import '../minor_screens/sub_categ_products.dart';
import '../widget/appber_widgets.dart';

class SupplierBalance extends StatelessWidget {
  const SupplierBalance({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: AppBerTitle(title: 'SupplierBalance'),
        leading: AppBeckButton(),
      ),
    );
  }
}
