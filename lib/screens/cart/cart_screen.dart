import 'package:flutter/material.dart';
import '../../widgets/widgets.dart';

class CartScreen extends StatelessWidget {

  static const String routeName = '/cart';
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: 'Cart'),
      bottomNavigationBar: CustomNavBar(),
    );
  }

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => CartScreen(),
    );
  }
}