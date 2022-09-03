import 'package:flutter/material.dart';
import '../../widgets/widgets.dart';

class CatalogScreen extends StatelessWidget {

  static const String routeName = '/catalog';
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: 'Catalog'),
      bottomNavigationBar: CustomNavBar(),
    );
  }

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => CatalogScreen(),
    );
  }
}