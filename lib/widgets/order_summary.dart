import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/cart/cart_bloc.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
  builder: (context, state) {
      if(state is CartLoaded) {
        return Column(
          children: [
            const Divider(
              thickness: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('SUBTOTAL', style: Theme
                          .of(context)
                          .textTheme
                          .headline5,),
                      Text('\$${state.cart.subtotalString}', style: Theme
                          .of(context)
                          .textTheme
                          .headline5,)
                    ],
                  ),
                  SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Text('DELIVERY', style: Theme
                          .of(context)
                          .textTheme
                          .headline5,),
                      Text('\$${state.cart.deliveryFeeString}', style: Theme
                          .of(context)
                          .textTheme
                          .headline5,)
                    ],
                  ),

                ],
              ),
            ),
            Stack(
              children: [
                Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.black.withAlpha(50),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(5.0),
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
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

                          Text('TOTAL', style: Theme
                              .of(context)
                              .textTheme
                              .headline5!
                              .copyWith(color: Colors.white),),
                          Text('\$${state.cart.totalFeeString}', style: Theme
                              .of(context)
                              .textTheme
                              .headline5!
                              .copyWith(color: Colors.white),)
                        ],
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ],
        );
      }else
        return Text("Something Went Wrong");
  },
);
  }
}
