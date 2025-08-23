import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/feature/favorite/data/repo/favorite_repo.dart';

import 'package:flutter_application_1/feature/favorite/presentation/view_model/cubit/favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit(this.favoriteRepo) : super(FavoriteInitial());
  final FavoriteRepo favoriteRepo;

  favorite() async {
    emit(FavoriteLoading());
    final response = await favoriteRepo.favorite();
    response.fold(
      (errMessage) => emit(FavoriteFailure(errMessage: errMessage)),
      (FavoriteResponse) =>
          emit(FavoriteSuccess(favoritemodel: FavoriteResponse.list)),
    );
  }

  addFavorite(int productId) async {
    emit(AddFavoriteLoading());
    final response = await favoriteRepo.addfavorite(productId);
    response.fold(
      (errMessage) => emit(AddFavoriteFailure(errMessage: errMessage)),
      (messagere) => emit(AddFavoriteSuccess(message: messagere.message)),
    );
  }

  deleteFavorite(int productId) async {
    emit(DeleteFavoriteLoading());
    final response = await favoriteRepo.deleteFavorite(productId);
    response.fold(
      (errMessage) => emit(DeleteFavoriteFailure(errMessage: errMessage)),
      (messagere) => emit(DeleteFavoriteSuccess(message: messagere.message)),
    );
  }
}
