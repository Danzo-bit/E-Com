
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/models/product_model.dart';

import '../blocs/cart/cart_bloc.dart';
import '../blocs/wishlist/wishlist_bloc.dart';
import '../screens/cart/cart_screen.dart';

class CustomNavBar extends StatelessWidget{
  final String screen;
  final Product? product;
  const CustomNavBar({Key? key, required this.screen, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BottomAppBar(
      color: Colors.black,
      child: Container(
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: _selectNavBar(context, screen)!,
        ),
      ),
    );
  }

  List<Widget>? _selectNavBar(context, screen){
    switch(screen){
      case '/':
        return _buildNavBar(context);
      case '/catalog':
        return _buildNavBar(context);
      case '/wishlist':
        return _buildNavBar(context);
      case '/product':
        return _buildAddToCartNavBar(context, product);
      case '/cart':
        return _buildGoToCheckoutNavBar(context);
      case '/checkout':
        return _buildOrderNowNavBar(context);
      default:
        _buildNavBar(context);
    }
  }

  List<Widget> _buildNavBar(context){
    return [
      IconButton(
        icon: Icon(Icons.home, color: Colors.white,),
        onPressed: () {
          Navigator.pushNamed(context, '/');
        },),
      IconButton(
        icon: Icon(Icons.shopping_cart, color: Colors.white,),
        onPressed: () {
          Navigator.pushNamed(context, '/cart');
        },),
      IconButton(
        icon: Icon(Icons.person, color: Colors.white,),
        onPressed: () {
          Navigator.pushNamed(context, '/user');
        },)
    ];
  }

  List<Widget> _buildGoToCheckoutNavBar(context) {
    return [
      ElevatedButton(
          style: ElevatedButton.styleFrom(primary: Colors.white),
          onPressed: () {
            Navigator.pushNamed(context, '/checkout');
          },
          child: Text(
            'GO TO CHECKOUT',
            style: Theme
                .of(context)
                .textTheme
                .headline3!
                .copyWith(color: Colors.black),
          ))
    ];
  }

  List<Widget> _buildOrderNowNavBar(context) {
    return [
      ElevatedButton(
          style: ElevatedButton.styleFrom(primary: Colors.white),
          onPressed: () {

          },
          child: Text(
            'ORDER NOW',
            style: Theme
                .of(context)
                .textTheme
                .headline3!
                .copyWith(color: Colors.black),
          ))
    ];
  }

  List<Widget> _buildAddToCartNavBar(context, product) {
    return [
      IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.share,
            color: Colors.white,
          )),
      BlocBuilder<WishlistBloc, WishlistState>(
        builder: (context, state) {
          return IconButton(
              onPressed: () {
                context
                    .read<WishlistBloc>()
                    .add(AddWishlistProduct(product));

                const snackbar =
                SnackBar(content: Text('Added to Wishlist!'));
                ScaffoldMessenger.of(context).showSnackBar(snackbar);
              },
              icon: const Icon(
                Icons.favorite,
                color: Colors.white,
              ));
        },
      ),
      BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          return ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.white),
              onPressed: () {
                context.read<CartBloc>().add(
                    CartProductAdded(product: product));
                Navigator.pushNamed(context, CartScreen.routeName);
                const snackbar =
                SnackBar(content: Text('Added to Cart!'));
                ScaffoldMessenger.of(context).showSnackBar(snackbar);
              },
              child: Text(
                'ADD TO CART',
                style: Theme
                    .of(context)
                    .textTheme
                    .headline3!
                    .copyWith(color: Colors.black),
              ));
        },
      )
    ];
  }

}