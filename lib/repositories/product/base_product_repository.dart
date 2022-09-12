import 'package:my_app/models/product_model.dart';

abstract class BaseProductRepository{
  Stream<List<Product>> getAllProducts();
}