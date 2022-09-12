part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();
}
class LoadProducts extends ProductEvent {

  @override
  List<Object?> get props => throw UnimplementedError();
}

class UpdateProducts extends ProductEvent {
  final List<Product> products;

  UpdateProducts(this.products);

  @override
  List<Object?> get props => [products];
}
