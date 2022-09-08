import 'package:flutter/material.dart';
import 'package:my_app/models/models.dart';
import 'package:my_app/screens/screens.dart';
import '../../widgets/widgets.dart';

class CatalogScreen extends StatelessWidget {
  final Category category;

  const CatalogScreen({required this.category});
  static const String routeName = '/catalog';
  @override
  Widget build(BuildContext context) {
    final List<Product> categoryProducts = Product.products
                                            .where((product) => product.category == category.name)
                                            .toList();
    return Scaffold(
      appBar: CustomAppBar(title: category.name),
      bottomNavigationBar: CustomNavBar(),
      body: GridView.builder(
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
          }),
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
