part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}

final class CartLoading extends CartState {}

final class CartSuccess extends CartState {
  final List<CartModel> cartmodel;
  CartSuccess({required this.cartmodel});
}

final class CartFailure extends CartState {
  final String errMessage;
  CartFailure({required this.errMessage});
}


final class AddCartLoading extends CartState {}

final class AddCartSuccess extends CartState {
  final String message;
  AddCartSuccess({required this.message});
}

final class AddCartFailure extends CartState {
  final String errMessage;
  AddCartFailure({required this.errMessage});
}
final class DeleteCartLoading extends CartState {}
final class DeleteCartSuccess extends CartState {
  final String message;
  DeleteCartSuccess({required this.message});
}
final class DeleteCartFailure extends CartState {
  final String errMessage;
  DeleteCartFailure({required this.errMessage});
}