
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_app/screens/screens.dart';

class SplashScreen extends StatelessWidget {

  static const String routeName = '/splash';
  const SplashScreen({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => SplashScreen(),
    );
  }
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 2), () => Navigator.pushNamed(context, HomeScreen.routeName));
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image(image: AssetImage('images/logo.png',),width: 125,height: 125,),
          ),
          SizedBox(height: 5,),
          Container(
            child: Text('e-Shop', style: Theme.of(context).textTheme.headline5!.copyWith(color: Colors.white),),
          )
        ],
      ),
    );
  }
}
