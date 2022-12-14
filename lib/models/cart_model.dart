
import 'package:equatable/equatable.dart';
import 'package:my_app/models/product_model.dart';

class Cart extends Equatable{
  final List<Product> products;
  const Cart({this.products = const<Product>[]});

//getting total price from list
  double get subtotal => products.fold(0, (total, current) => total + current.price);
//converting total price from list to string
  String get subtotalString => subtotal.toStringAsFixed(2);

  double deliveryFee(subtotal){
    if(subtotal >= 30.0){
      return 0.0;
    }else{
      return 10.0;
    }
  }

//getting delivery fee
  String get deliveryFeeString => deliveryFee(subtotal).toStringAsFixed(2);
  //getting total fee
  double get totalFee => subtotal + deliveryFee(subtotal);

  String freeDelivery(subtotal){
    if(subtotal >= 30){
      return 'You have free Delivery';
    }else{
      double missing = 30.0 - subtotal;
      return 'Add \$${missing.toStringAsFixed(2)} for FREE Delivery';
    }
  }

  String get freeDeliveryString => freeDelivery(subtotal);

  String get totalFeeString => totalFee.toStringAsFixed(2);




  @override
  List<Object?> get props => [products];

  Map productQuantity(products){
    var quantity = {};

    products.forEach((product){
      if(!quantity.containsKey(product)){
        quantity[product] = 1;
      }else{
        quantity[product] += 1;
      }
    });

    return quantity;
  }

}