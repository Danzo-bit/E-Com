import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/product_model.dart';
import '../../repositories/product/product_repository.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository _productRepository;
  StreamSubscription? _streamSubscription;
  ProductBloc({required ProductRepository productRepository})
      : _productRepository = productRepository
  ,super(ProductLoading()) {
    // on<ProductEvent>((event, emit) {
    // });
  }

  @override
  Stream<ProductState> mapEventToState(
      ProductEvent event
      )async*{
    if(event is LoadProducts){
      yield* _mapLoadProductsToState();
    }
    if(event is UpdateProducts){
      yield* _mapUpdateProductsToState(event);
    }
  }

  Stream<ProductState> _mapLoadProductsToState()async*{
    _streamSubscription?.cancel();
    _streamSubscription = _productRepository.getAllProducts().listen(
            (products) {
          return add(UpdateProducts(products));
        });
  }

  Stream<ProductState> _mapUpdateProductsToState(UpdateProducts event)
  async*{
    yield ProductLoaded(products: event.products);
  }
}
