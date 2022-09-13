import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/widgets/order_summary.dart';
import '../../blocs/cart/cart_bloc.dart';
import '../../widgets/widgets.dart';

class CartScreen extends StatelessWidget {
  static const String routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: 'Cart'),
        bottomNavigationBar: CustomNavBar(screen: routeName),
        body: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            if(state is CartLoading){
              return Center(
                child: CircularProgressIndicator(),
              );
            }else if(state is CartLoaded){
              return  Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal:10.0, vertical: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                state.cart.freeDeliveryString,
                                style: Theme.of(context).textTheme.headline5,
                              ),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.black,
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0))
                                  ),
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/');
                                  },
                                  child: Text(
                                    'Add More Items',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline5!
                                        .copyWith(color: Colors.white),
                                  ))
                            ],
                          ),
                        ),
                        SizedBox(height: 10,),
                        SizedBox(
                          height: 400,
                          child: ListView.builder(
                              itemCount: state.cart.productQuantity(state.cart.products).keys.length,
                              itemBuilder: (context, index){
                                return CartProductCard(
                                    product: state.cart.productQuantity(state.cart.products).keys.elementAt(index),
                                  quantity: state.cart.productQuantity(state.cart.products).values.elementAt(index),);
                              }),
                        ),
                      ],
                    ),
                    OrderSummary()


                  ],
                ),

              );
            }
            else
              return Text("Something Went Wrong");
          },
        )
    );
  }


  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => CartScreen(),
    );
  }
}


