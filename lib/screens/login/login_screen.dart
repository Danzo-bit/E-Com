import 'package:flutter/material.dart';
import 'package:my_app/screens/screens.dart';
import 'package:my_app/validator/auth_validator.dart';

import '../../widgets/widgets.dart';

class LoginScreen extends StatelessWidget {

  static const String routeName = '/login';
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Login',automaticallyImplyLeading: false,isWishlistOn: false,),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: _key,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                key: const ValueKey('email'),
                controller: _emailController,
                onChanged: (value){},
                validator: (value) => AuthValidator.validateEmail(value ?? ''),
                cursorColor: Colors.black,
                cursorHeight: 20.0,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(
                    color: Color.fromARGB(255, 42, 39, 39)
                  ),
                  isDense: true,
                  contentPadding: EdgeInsets.only(left: 5),
                  focusedBorder: UnderlineInputBorder(
                   borderSide: BorderSide(color: Colors.black)),
                ),
              ),
              const SizedBox(height: 20,),
              TextFormField(
                key: const ValueKey('password'),
                onChanged: (value){},
                controller: _passwordController,
                validator: (value) => AuthValidator.validatePassword(value ?? ''),
                cursorColor: Colors.black,
                obscureText: true,
                obscuringCharacter: '*',
                decoration: const InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(
                    color: Colors.black
                  ),
                  isDense: true,
                  contentPadding: EdgeInsets.only(left: 5),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                ),
              ),
              const SizedBox(height: 50,),
              ElevatedButton(
                key: const ValueKey('login_btn'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                  fixedSize: const Size(200, 20)
                ),
                  onPressed: (){
                    if(_key.currentState!.validate() == true){
                      //  Navigator.push(context,  HomeScreen.route());
                       Navigator.of(context).popAndPushNamed(HomeScreen.routeName);
                    }
                  },
                  child: const Text('Login')),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      fixedSize: const Size(200, 20)
                  ),
                  onPressed: (){
                    Navigator.of(context).pushNamed(SignupScreen.routeName);
                  },
                  child: const Text('Sign Up')),
            ],
          ),
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
