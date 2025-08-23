
import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/feature/cart/data/model/favorit_items_model.dart';
import 'package:meta/meta.dart';

import 'package:flutter_application_1/feature/cart/data/repo/cart_repo.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(this.cartRepository) : super(CartInitial());
  final CartRepository cartRepository;

  getUsercart() async {
    emit(CartLoading());
    final response = await cartRepository.getUsercart();
    response.fold(
      (errMessage) => emit(CartFailure(errMessage: errMessage)),
      (CartResponse) => emit(CartSuccess(cartmodel: CartResponse.list)),
    );
  }

  addToCart(int productId) async {
    emit(AddCartLoading());
    final response = await cartRepository.addToCart(productId);
    response.fold(
      (errMessage) => emit(AddCartFailure(errMessage: errMessage)),
      (messagere) => emit(AddCartSuccess(message: messagere.message)),
    );
  }
   deleteFromCart(int productId) async {
    emit(DeleteCartLoading());
    final response = await cartRepository.deleteFromCart(productId);
    response.fold(
      (errMessage) => emit(DeleteCartFailure(errMessage: errMessage)),
      (messagere) => emit(DeleteCartSuccess(message: messagere.message)),
    );
  }
}