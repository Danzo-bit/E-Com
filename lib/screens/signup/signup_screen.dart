import 'package:flutter/material.dart';
import 'package:my_app/validator/auth_validator.dart';

import '../../widgets/widgets.dart';
import '../login/login_screen.dart';

class SignupScreen extends StatelessWidget {

  static const String routeName = '/signup';
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  final GlobalKey<FormState> _key = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(title: 'Signup',automaticallyImplyLeading: false, isWishlistOn: false,),
    body: Padding(
      padding: const EdgeInsets.all(15.0),
      child: SingleChildScrollView(
        child: Form(
          key: _key,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: 50,
              ),
              Container(
                height: MediaQuery.of(context).size.height * .5,
                child: Column(
                  
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     TextFormField(
                      validator: (value) => AuthValidator.validateEmail(value ?? ''),
                      controller: _emailController,
                        onChanged: (value){},
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          isDense: true,
                          contentPadding: EdgeInsets.only(left: 5),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                        ),
                      ),
                    
                     TextFormField(
                      validator: (value) => AuthValidator.validateName(value ?? ''),
                      controller: _nameController,
                        onChanged: (value){},
                        decoration: const InputDecoration(
                          labelText: 'Full Name',
                          isDense: true,
                          contentPadding: EdgeInsets.only(left: 5),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                        ),
                      ),
                    TextFormField(
                      validator: (value) => AuthValidator.validateContry(value ?? ''),
                      controller: _countryController,
                        onChanged: (value){},
                        decoration: const InputDecoration(
                          labelText: 'Country',
                          isDense: true,
                          contentPadding: EdgeInsets.only(left: 5),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                        ),
                      ),
           TextFormField(
            validator: (value) => AuthValidator.validateCity(value ?? ''),
                        controller: _cityController,
                        onChanged: (value){},
                        decoration: const InputDecoration(
                          labelText: 'City',
                          isDense: true,
                          contentPadding: EdgeInsets.only(left: 5),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                        ),
                      ),
                    TextFormField(
                      validator: (value) => AuthValidator.validateAddress(value ?? ''),
                      controller: _addressController,
                        onChanged: (value){},
                        decoration: const InputDecoration(
                          labelText: 'Address',
                          isDense: true,
                          contentPadding: EdgeInsets.only(left: 5),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                        ),
                      ),
                   
                    // TextFormField(
                    //   onChanged: (value){},
                    //   decoration: const InputDecoration(
                    //     labelText: 'Zip Code',
                    //     isDense: true,
                    //     contentPadding: EdgeInsets.only(left: 5),
                    //     focusedBorder: UnderlineInputBorder(
                    //         borderSide: BorderSide(color: Colors.black)),
                    //   ),
                    // ),
                    TextFormField(
                      validator: (value) => AuthValidator.validatePassword(value ?? ''),
                      controller: _passwordController,
                        onChanged: (value){},
                        decoration: const InputDecoration(
                          labelText: 'Password',
                          isDense: true,
                          contentPadding: EdgeInsets.only(left: 5),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                        ),
                      ),
                       SizedBox(
                height: 100,
              ),
              
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      fixedSize: const Size(200, 20)
                  ),
                  onPressed: (){
                     if(_key.currentState!.validate() == true){
                      //  Navigator.push(context,  HomeScreen.route());
                       Navigator.of(context).popAndPushNamed(LoginScreen.routeName);
                    }
                  },
                  child: const Text('Sign Up')),
                    
                  ],
                ),
              ),
             
            ],
          ),
        ),
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
