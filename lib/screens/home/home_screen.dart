import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/models/models.dart';
import '../../blocs/category/category_bloc.dart';
import '../../blocs/product/product_bloc.dart';
import '../../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(
          title: 'E-shop',
          automaticallyImplyLeading: false,
        ),
        bottomNavigationBar: const CustomNavBar(screen: routeName),
        body: Column(
          children: [
            Container(child: BlocBuilder<CategoryBloc, CategoryState>(
              builder: (context, state) {
                if (state is CategoryLoading) {
                  return const SizedBox(
                    height: 100,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
                if (state is CategoryLoaded) {
                  return CarouselSlider(
                    options: CarouselOptions(
                      aspectRatio: 1.5,
                      viewportFraction: 0.9,
                      enlargeCenterPage: true,
                      enlargeStrategy: CenterPageEnlargeStrategy.height,
                    ),
                    items: state.categories
                        .map((category) => HeroCarouselCard(category: category))
                        .toList(),
                  );
                } else {
                  return const Text('something went wrong');
                }
              },
            )),
            const SizedBox(
              height: 20,
            ),
            const SectionTitle(title: 'RECOMMENDED'),
            Expanded(
              child: BlocBuilder<ProductBloc, ProductState>(
                builder: (context, state) {
                  if (state is ProductLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is ProductLoaded) {
                    return ProductCarousel(
                        products: state.products
                            .where((product) => product.isRecommended)
                            .toList());
                  } else {
                    return const Text('Something went wrong!');
                  }
                },
              ),
            ),
            const SectionTitle(title: 'MOST POPULAR'),
            Expanded(
              child: BlocBuilder<ProductBloc, ProductState>(
                builder: (context, state) {
                  if (state is ProductLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is ProductLoaded) {
                    return ProductCarousel(
                        products: state.products
                            .where((product) => product.isPopular)
                            .toList());
                  } else {
                    return const Text('Something went wrong!');
                  }
                },
              ),
            ),
          ],
        ));
  }

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => HomeScreen(),
    );
  }
}
