part of 'cart_cubit.dart';

abstract class CartState {}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartSuccess extends CartState {
  final List<CartModel> cartmodel;
  CartSuccess({required this.cartmodel});
}

class CartFailure extends CartState {
  final String errMessage;
  CartFailure({required this.errMessage});
}

class AddCartLoading extends CartState {}

class AddCartSuccess extends CartState {
  final String message;
  AddCartSuccess({required this.message});
}

class AddCartFailure extends CartState {
  final String errMessage;
  AddCartFailure({required this.errMessage});
}

class DeleteCartLoading extends CartState {}

class DeleteCartSuccess extends CartState {
  final String message;
  DeleteCartSuccess({required this.message});
}

class DeleteCartFailure extends CartState {
  final String errMessage;
  DeleteCartFailure({required this.errMessage});
}