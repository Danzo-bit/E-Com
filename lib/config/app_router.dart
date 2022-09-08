import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:my_app/models/models.dart';
import 'package:my_app/screens/screens.dart';

class AppRouter{
  static Route onGenerateRoute(RouteSettings settings){
    log('This is route: ${settings.name}');

    switch (settings.name){
      case HomeScreen.routeName:
        return HomeScreen.route();
      case CartScreen.routeName:
        return CartScreen.route();
      case ProductScreen.routeName:
        return ProductScreen.route();
      case CatalogScreen.routeName:
        return CatalogScreen.route(category: settings.arguments as Category);
      case WishlistScreen.routeName:
        return WishlistScreen.route();
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute(){
    return MaterialPageRoute(
        builder: (_) =>
            Scaffold(
              appBar: AppBar(
                title: Text('Error'),
      ),
    ),
    settings: RouteSettings(name: '/error'));
  }
}