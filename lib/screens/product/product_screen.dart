import 'package:flutter/material.dart';
import '../../widgets/widgets.dart';

class ProductScreen extends StatelessWidget {

  static const String routeName = '/product';
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: 'Product'),
      bottomNavigationBar: CustomNavBar(),
    );
  }

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => ProductScreen(),
    );
  }
}