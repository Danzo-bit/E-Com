
import 'package:equatable/equatable.dart';
import 'package:my_app/models/product_model.dart';

class Cart extends Equatable{
  List<Product> products;
  Cart({this.products = const<Product>[]});

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
  //geting total fee
  double get totalFee => subtotal + deliveryFee(subtotal);

  String freeDelivery(subtotal){
    if(subtotal >= 150){
      return 'You have free Delivery';
    }else{
      double missing = 30.0 - subtotal;
      return 'Add \$${missing.toStringAsFixed(2)} for FREE Delivery';
    }
  }

  String get freeDeliveryString => freeDelivery(subtotal);



  @override
  List<Object?> get props => [products];

}