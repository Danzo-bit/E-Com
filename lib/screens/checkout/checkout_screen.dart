import 'package:flutter/material.dart';
import 'package:my_app/widgets/widgets.dart';

import '../../widgets/custom_appbar.dart';
import '../../widgets/custom_navbar.dart';

class CheckoutScreen extends StatelessWidget {


  const CheckoutScreen();
  static const String routeName = '/checkout';
  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController nameController = TextEditingController();
    final TextEditingController addressController = TextEditingController();
    final TextEditingController cityController = TextEditingController();
    final TextEditingController countryController = TextEditingController();
    final TextEditingController messageController = TextEditingController();

    return Scaffold(
      appBar: CustomAppBar(title: 'Checkout'),
      bottomNavigationBar: CustomNavBar(screen: routeName,),
      body:Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('CUSTOMER INFORMATION', style: Theme.of(context).textTheme.headline3,),
            _buldTextFormField(emailController,context, 'Email'),
            _buldTextFormField(nameController,context, 'Full Name'),
            Text('DELIVERY INFORMATION', style: Theme.of(context).textTheme.headline3,),
            _buldTextFormField(addressController,context, 'Address'),
            _buldTextFormField(cityController,context, 'City'),
            _buldTextFormField(countryController,context, 'Country'),
            _buldTextFormField(messageController,context, 'Special Message'),

            Text('ORDER SUMMARY', style: Theme.of(context).textTheme.headline3,),
            OrderSummary()
          ],
        ),
      ),
    );

  }
  Padding _buldTextFormField(
      TextEditingController controller,
      BuildContext context,
      String labelText
      ){
      return Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
          children: [
            SizedBox(
              width: 75,
              child: Text(labelText,
              style: Theme.of(context).textTheme.bodyText1,),
            ),
            Expanded(child: TextFormField(
              controller: controller,
              decoration: InputDecoration(
                isDense: true,
                contentPadding: const EdgeInsets.only(left: 5),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black
                  )
                ),
              ),
            ))
        ],
      ),
      );
  }

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => CheckoutScreen()
    );
  }
}
