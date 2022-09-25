import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';

class SignupScreen extends StatelessWidget {

  static const String routeName = '/signup';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: 'Signup',automaticallyImplyLeading: false, isWishlistOn: false,),
    body: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextFormField(
            onChanged: (value){},
            decoration: InputDecoration(
              labelText: 'Email',
              isDense: true,
              contentPadding: const EdgeInsets.only(left: 5),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black)),
            ),
          ),
          TextFormField(
            onChanged: (value){},
            decoration: InputDecoration(
              labelText: 'Full Name',
              isDense: true,
              contentPadding: const EdgeInsets.only(left: 5),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black)),
            ),
          ),
          TextFormField(
            onChanged: (value){},
            decoration: InputDecoration(
              labelText: 'Country',
              isDense: true,
              contentPadding: const EdgeInsets.only(left: 5),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black)),
            ),
          ),
          TextFormField(
            onChanged: (value){},
            decoration: InputDecoration(
              labelText: 'City',
              isDense: true,
              contentPadding: const EdgeInsets.only(left: 5),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black)),
            ),
          ),
          TextFormField(
            onChanged: (value){},
            decoration: InputDecoration(
              labelText: 'Address',
              isDense: true,
              contentPadding: const EdgeInsets.only(left: 5),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black)),
            ),
          ),
          TextFormField(
            onChanged: (value){},
            decoration: InputDecoration(
              labelText: 'Zip Code',
              isDense: true,
              contentPadding: const EdgeInsets.only(left: 5),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black)),
            ),
          ),
          TextFormField(
            onChanged: (value){},
            decoration: InputDecoration(
              labelText: 'Password',
              isDense: true,
              contentPadding: const EdgeInsets.only(left: 5),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black)),
            ),
          ),
          SizedBox(height: 10,),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                  fixedSize: Size(200, 20)
              ),
              onPressed: (){},
              child: Text('Sign Up')),
        ],
      ),
    ),
    );
  }

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => SignupScreen(),
    );
  }
}
