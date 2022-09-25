import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/models/models.dart';
import 'package:my_app/models/models.dart';
import 'package:my_app/widgets/widgets.dart'; 

import '../../blocs/checkout/checkout_bloc.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/custom_navbar.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen();
  static const String routeName = '/checkout';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const CustomAppBar(title: 'Checkout', isWishlistOn: false,),
      bottomNavigationBar: const CustomNavBar(
        screen: routeName,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: BlocBuilder<CheckoutBloc, CheckoutState>(
          builder: (context, state) {
            if(state is CheckoutLoading){
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if(state is CheckoutLoaded){
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'CUSTOMER INFORMATION',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  _buldTextFormField((value){
                    context.read<CheckoutBloc>().add(UpdateCheckout(
                        email: value
                    ));
                  }, context, 'Email'),
                  _buldTextFormField((value){
                    context.read<CheckoutBloc>().add(UpdateCheckout(
                        fullName: value
                    ));
                  }, context, 'Full Name'),
                  Text(
                    'DELIVERY INFORMATION',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  _buldTextFormField((value){
                    context.read<CheckoutBloc>().add(UpdateCheckout(
                      address: value
                    ));
                  }, context, 'Address'),
                  _buldTextFormField((value){
                    context.read<CheckoutBloc>().add(UpdateCheckout(
                        city: value
                    ));
                  }, context, 'City'),
                  _buldTextFormField((value){
                    context.read<CheckoutBloc>().add(UpdateCheckout(
                        country: value
                    ));
                  }, context, 'Country'),
                  _buldTextFormField(
                          (value){
                        context.read<CheckoutBloc>().add(UpdateCheckout(
                            message: value
                        ));
                      }, context, 'Special Message'),
                  Text(
                    'ORDER SUMMARY',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  const OrderSummary()
                ],
              );
            }
            else
              return const Center(
                child: Text('Something went wrong!'),
              );

          },
        ),
      ),
    );
  }

  Padding _buldTextFormField(Function(String) onChanged,
      BuildContext context, String labelText) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        children: [
          SizedBox(
            width: 75,
            child: Text(
              labelText,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          Expanded(
              child: TextFormField(
            onChanged: onChanged,
            decoration: const InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.only(left: 5),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black)),
            ),
          ))
        ],
      ),
    );
  }


  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const CheckoutScreen());
  }
}
