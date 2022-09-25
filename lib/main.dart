import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/blocs/auth/auth_bloc.dart';
import 'package:my_app/blocs/cart/cart_bloc.dart';
import 'package:my_app/blocs/category/category_bloc.dart';
import 'package:my_app/blocs/checkout/checkout_bloc.dart';
import 'package:my_app/config/app_router.dart';
import 'package:my_app/config/theme.dart';
import 'package:my_app/repositories/auth/auth_repository.dart';
import 'package:my_app/repositories/category/category_repository.dart';
import 'package:my_app/repositories/checkout/checkout_repository.dart';
import 'package:my_app/repositories/product/product_repository.dart';
import 'package:my_app/repositories/user/user_repository.dart';
import 'package:my_app/screens/confirm_order/confirm_order_screen.dart';
import 'blocs/product/product_bloc.dart';
import 'blocs/wishlist/wishlist_bloc.dart';
import 'screens/screens.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => AuthRepository()),
        RepositoryProvider(create: (context) => UserRepository()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => WishlistBloc()..add(StartWishlist()),
          ),
          BlocProvider(create: (_) => CartBloc()..add(CartStarted())),
          BlocProvider(
              create: (_) =>
                  CategoryBloc(categoryRepository: CategoryRepository())
                    ..add(LoadCategories())),
          BlocProvider(
              create: (_) =>
              ProductBloc(productRepository: ProductRepository())
                ..add(LoadProducts())),
          BlocProvider(
              create: (context) =>
                  CheckoutBloc(
                      cartBloc: context.read<CartBloc>(),
                      checkoutRepository: CheckoutRepository())),
          BlocProvider(create: (ctx) => AuthBloc(authRepository: ctx.read<AuthRepository>(), userRepository: ctx.read<UserRepository>()))
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "e-Shop",
          theme: theme(),
          onGenerateRoute: AppRouter.onGenerateRoute,
          initialRoute:
          ConfirmOrder.routeName,
          // SplashScreen.routeName,
        ),
      ),
    );
  }
}
