import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_app/config/app_router.dart';
import 'package:my_app/config/theme.dart';
import 'screens/screens.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "E-Shop",
      theme: theme(),
      onGenerateRoute: AppRouter.onGenerateRoute,
      initialRoute: HomeScreen.routeName,
    );
  }
}



