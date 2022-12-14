import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:my_app/models/models.dart';
import 'package:my_app/screens/confirm_order/confirm_order_screen.dart';
import 'package:my_app/screens/screens.dart';

class AppRouter{
  static Route onGenerateRoute(RouteSettings settings){
    log('This is route: ${settings.name}');

    switch (settings.name){
      case HomeScreen.routeName:
        return HomeScreen.route();
      case SplashScreen.routeName:
        return SplashScreen.route();
      case CartScreen.routeName:
        return CartScreen.route();
      case ProductScreen.routeName:
        return ProductScreen.route(product: settings.arguments as Product);
      case CatalogScreen.routeName:
        return CatalogScreen.route(category: settings.arguments as Category);
      case WishlistScreen.routeName:
        return WishlistScreen.route();
      case CheckoutScreen.routeName:
        return CheckoutScreen.route();
      case SignupScreen.routeName:
        return SignupScreen.route();
      case LoginScreen.routeName:
        return LoginScreen.route();
      case ConfirmOrder.routeName:
        return ConfirmOrder.route();
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