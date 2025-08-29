
import 'package:flutter_application_1/feature/favorite/data/model/favorite_model.dart';

sealed class FavoriteState {}

final class FavoriteInitial extends FavoriteState  {}

final class FavoriteLoading extends FavoriteState  {}

final class FavoriteSuccess extends FavoriteState  {
  final List<FavoriteModel> favoritemodel;
  FavoriteSuccess({required this.favoritemodel});
}

final class FavoriteFailure extends FavoriteState  {
  final String errMessage;
  FavoriteFailure({required this.errMessage});
}


final class AddFavoriteLoading extends FavoriteState  {}

final class AddFavoriteSuccess extends FavoriteState  {
  final String message;
  AddFavoriteSuccess({required this.message});
}

final class AddFavoriteFailure extends FavoriteState  {
  final String errMessage;
  AddFavoriteFailure({required this.errMessage});
}
final class DeleteFavoriteLoading extends FavoriteState  {}
final class DeleteFavoriteSuccess extends FavoriteState  {
  final String message;
  DeleteFavoriteSuccess({required this.message});
}
final class DeleteFavoriteFailure extends FavoriteState {
  final String errMessage;
  DeleteFavoriteFailure({required this.errMessage});
}