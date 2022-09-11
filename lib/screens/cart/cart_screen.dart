import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/cart/cart_bloc.dart';
import '../../models/cart_model.dart';
import '../../models/product_model.dart';
import '../../widgets/widgets.dart';

class CartScreen extends StatelessWidget {
  static const String routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: 'Cart'),
        bottomNavigationBar: BottomAppBar(
          color: Colors.black,
          child: Container(
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.white),
                    onPressed: () {},
                    child: Text(
                      'GO TO CHECKOUT',
                      style: Theme
                          .of(context)
                          .textTheme
                          .headline3!
                          .copyWith(color: Colors.black),
                    ))
              ],
            ),
          ),
        ),
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
                              itemCount: state.cart.products.length,
                              itemBuilder: (context, index){
                                return CartProductCard(product: state.cart.products[index]);
                              }),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Divider(
                          thickness: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('SUBTOTAL', style: Theme.of(context).textTheme.headline5,),
                                  Text('\$${state.cart.subtotalString}', style: Theme.of(context).textTheme.headline5,)
                                ],
                              ),
                              SizedBox(height: 15,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [

                                  Text('DELIVERY', style: Theme.of(context).textTheme.headline5,),
                                  Text('\$${state.cart.deliveryFeeString}', style: Theme.of(context).textTheme.headline5,)
                                ],
                              ),

                            ],
                          ),
                        ),
                        Stack(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 60,
                              decoration: BoxDecoration(
                                color: Colors.black.withAlpha(50),
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.all(5.0),
                              width: MediaQuery.of(context).size.width,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [

                                      Text('TOTAL', style: Theme.of(context).textTheme.headline5!.copyWith(color: Colors.white),),
                                      Text('\$${state.cart.totalFeeString}', style: Theme.of(context).textTheme.headline5!.copyWith(color: Colors.white),)
                                    ],
                                  ),
                                ),
                              ),
                            ),

                          ],
                        ),
                      ],
                    )


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


