import 'package:flutter/material.dart';
import 'package:my_app/screens/screens.dart';

import '../../widgets/widgets.dart';

class LoginScreen extends StatelessWidget {

  static const String routeName = '/login';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Login',automaticallyImplyLeading: false,isAuth: true,),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
            SizedBox(height: 20,),
            TextFormField(
              onChanged: (value){},
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                isDense: true,
                contentPadding: const EdgeInsets.only(left: 5),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
              ),
            ),
            SizedBox(height: 50,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
                fixedSize: Size(200, 20)
              ),
                onPressed: (){},
                child: Text('Login')),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    fixedSize: Size(200, 20)
                ),
                onPressed: (){
                  Navigator.of(context).pushNamed(SignupScreen.routeName);
                },
                child: Text('Sign Up')),
          ],
        ),
      ),
    );
  }

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => LoginScreen(),
    );
  }
}
