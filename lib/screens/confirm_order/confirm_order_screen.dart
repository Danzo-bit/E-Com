
import 'package:flutter/material.dart';

class ConfirmOrder extends StatefulWidget {
 static final String routeName = '/confirmOrder';

  const ConfirmOrder({super.key});

  @override
  State<ConfirmOrder> createState() => _ConfirmOrderState();
}

class _ConfirmOrderState extends State<ConfirmOrder> {

  @override
  Widget build(BuildContext context) {
    return Container();
  }

   static Route route() {
    return MaterialPageRoute(
        settings: RouteSettings(name: ConfirmOrder.routeName),
        builder: (_) => ConfirmOrder());
  }
}