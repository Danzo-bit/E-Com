import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_app/models/product_model.dart';

import '../../models/cart_model.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartLoading()) {
    // on<CartEvent>((event, emit) {
    // });
  }

  @override
  Stream<CartState> mapEventToState(
      CartEvent event
      )async*{
    if(event is CartStarted){
      yield* _mapCartStartedToState();
    }
    else if(event is CartProductAdded){
      yield* _mapCartProductAdeedToState(event, state);
    }
    else if(event is CartProductRemoved){
      yield* _mapCartProductRemovedToState(event, state);
    }
  }

  Stream<CartState> _mapCartStartedToState() async*{
    yield CartLoading();
    try{
      await Future<void>.delayed(Duration(seconds: 1));
      yield CartLoaded();
    }catch(_){}
  }
  Stream<CartState> _mapCartProductAdeedToState(
      CartProductAdded event,
      CartState state
      )async*{
    if(state is CartLoaded){
      try {
        yield CartLoaded(cart: Cart(products: List.from(state.cart.products)..add(event.product)));
      }catch(_){}
    }
  }
  Stream<CartState> _mapCartProductRemovedToState(
      CartProductRemoved event,
      CartState state
      )async*{
    if(state is CartLoaded){
      try {
        yield CartLoaded(cart: Cart(products: List.from(state.cart.products)..remove(event.product)));
      }catch(_){}
    }
  }
}
