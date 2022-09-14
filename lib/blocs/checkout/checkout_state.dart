part of 'checkout_bloc.dart';

abstract class CheckoutState extends Equatable {
  const CheckoutState();
}

class CheckoutLoading extends CheckoutState {
  @override
  List<Object> get props => [];
}

class CheckoutLoaded extends CheckoutState {

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
  final Checkout checkout;

  CheckoutLoaded({
    this.address,
    this.city,
    this.country,
    this.message,
    this.subtotal,
    this.deliveryFee,
    this.total,
    this.products,
    this.fullName,
    this.email,}) :
        checkout = Checkout(
      fullName: fullName,
      email: email,
      address: address,
      city: city,
      country: country,
      message: message,
      subtotal: subtotal,
      deliveryFee: deliveryFee,
      total: total,
      products: products);


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
}
