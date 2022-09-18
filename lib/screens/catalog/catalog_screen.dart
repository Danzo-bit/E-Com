import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/models/models.dart';
import 'package:my_app/screens/screens.dart';
import '../../blocs/product/product_bloc.dart';
import '../../widgets/widgets.dart';

class CatalogScreen extends StatelessWidget {
  final Category category;

  const CatalogScreen({required this.category});
  static const String routeName = '/catalog';
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: CustomAppBar(title: category.name),
      bottomNavigationBar: CustomNavBar(screen: routeName,),
      body: BlocBuilder<ProductBloc, ProductState>(
  builder: (context, state) {

        if(state is ProductLoading){
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if(state is ProductLoaded){
          final List<Product> categoryProducts = state.products
              .where((product) => product.category == category.name)
              .toList();
          return GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.15,
              ),
              itemCount: categoryProducts.length,
              itemBuilder: (context, index) {
                return Center(
                    child: ProductCard(
                      product: categoryProducts[index],
                      widthFactor: 2.2,
                    ));
              });
        }else{
          return Text('Something went wrong!');
        }

  },
),
    );
  }

  static Route route({required Category category}) {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => CatalogScreen(
        category: category,
      ),
    );
  }
}
