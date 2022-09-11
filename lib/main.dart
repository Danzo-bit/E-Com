import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:my_app/config/app_router.dart';
import 'package:my_app/config/theme.dart';
import 'blocs/wishlist/wishlist_bloc.dart';
import 'screens/screens.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) => WishlistBloc()..add(StartWishlist()),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "E-Shop",
        theme: theme(),
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: HomeScreen.routeName,
      ),
    );
  }
}



