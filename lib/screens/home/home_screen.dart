import 'package:flutter/material.dart';
import '../../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {

  static const String routeName = '/';
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: 'E-shop'),
      bottomNavigationBar: CustomNavBar(),
    );
  }

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => HomeScreen(),
    );
  }
}