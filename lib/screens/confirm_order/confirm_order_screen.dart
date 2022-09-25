
import 'package:flutter/material.dart';
import 'package:my_app/config/theme.dart';
import 'package:my_app/widgets/custom_appbar.dart';
import 'package:my_app/widgets/custom_navbar.dart';
import 'package:my_app/widgets/order_summary.dart';

class ConfirmOrder extends StatelessWidget {
 static const String routeName = '/confirmOrder';

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(title: 'Confirm Order'),
      bottomNavigationBar: CustomNavBar(screen: routeName),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [Container(color: Colors.black,
              width: double.infinity,
              height: 400,),
                  const Icon(
                    Icons.car_rental,
                    color: Colors.white,
                    size: 200,
                    
                  ),
                  Positioned(
                    bottom: 50,
                    child: Text('Your order is complete!!!', style: Theme.of(context).textTheme.headline3!.copyWith(color: Colors.white),))              ]
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text('Thank you for purchasing on E-Shop...', style: Theme.of(context).textTheme.headline5,)
                    ,SizedBox(
                      height: 20,
                    ),
                    OrderSummary(),
                    Divider(
                      thickness: 2,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    
                    
                  ],
                ),
              ),
            )
          ],
        ),
      );
  }

   static Route route() {
    return MaterialPageRoute(
        settings: RouteSettings(name: ConfirmOrder.routeName),
        builder: (_) =>  ConfirmOrder());
  }
}