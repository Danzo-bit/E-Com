part of 'checkout_bloc.dart';

abstract class CheckoutEvent extends Equatable {
  const CheckoutEvent();
}

class UpdateCheckout extends CheckoutEvent{
  final String? fullName;
  final String? email;
  final String? address;
  final String? city;
  final String? country;
  final String? message;
  final Cart? cart;

  UpdateCheckout({
    this.fullName,
    this.email,
    this.address,
    this.city,
    this.country,
    this.message,
    this.cart,

});

  @override
  List<Object?> get props => [
    fullName,
    email,
    address,
    city,
    country,
    message,
    cart
  ];

}

class ConfirmCheckout extends CheckoutEvent{
  final Checkout checkout;

  ConfirmCheckout({required this.checkout});
  @override
  List<Object?> get props => [checkout];

}
