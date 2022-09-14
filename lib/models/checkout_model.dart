import 'package:equatable/equatable.dart';
import 'package:my_app/models/product_model.dart';

class Checkout extends Equatable{

  final String? fullName;
  final String? email;
  final String? address;
  final String? city;
  final String? country;
  final String? message;
  final String? subtotal;
  final String? deliveryFee;
  final String? total;
  final List<Product>? products;

  const Checkout({
    required this.fullName,
    required this.email,
    required this.address,
    required this.city,
    required this.country,
    required this.message,
    required this.subtotal,
    required this.deliveryFee,
    required this.total,
    required this.products
});


  @override
  List<Object?> get props => [
    fullName,
    email,
    address,
    city,
    country,
    message,
    subtotal,
    deliveryFee,
    total,
    products
  ];


  Map<String, Object> toDocument() {
    Map customerAddress = Map();
    customerAddress['address'] = address;
    customerAddress['city'] = city;
    customerAddress['country'] = country;
    customerAddress['message'] = message;

    return {
      'customerAddress':customerAddress,
      'customerName': fullName!,
      'customerEmail': email!,
      'products': products!.map((product) => product.name).toList(),
      'subtotal': subtotal!,
      'deliveryFee':deliveryFee!,
      'total': total!
    };
  }

}