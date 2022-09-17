
import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/screens/screens.dart';

import '../../blocs/auth/auth_bloc.dart';

class SplashScreen extends StatelessWidget {

  static const String routeName = '/splash';
  const SplashScreen({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => SplashScreen(),
    );
  }
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 2), () => Navigator.pushNamed(context, HomeScreen.routeName));
    return BlocListener<AuthBloc, AuthState>(
      listenWhen: (previous, current)=> previous.authUser != current.authUser,
  listener: (context, state) {
    // TODO: implement listener
    log('Splash Screen Auth Listener Listened');
  },
  child: Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image(image: AssetImage('images/logo.png',),width: 125,height: 125,),
          ),
          SizedBox(height: 5,),
          Container(
            child: Text('e-Shop', style: Theme.of(context).textTheme.headline5!.copyWith(color: Colors.white),),
          )
        ],
      ),
    ),
);
  }
}
