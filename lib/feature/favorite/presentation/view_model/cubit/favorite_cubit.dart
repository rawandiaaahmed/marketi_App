import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/feature/favorite/data/repo/favorite_repo.dart';
import 'package:flutter_application_1/feature/favorite/presentation/view_model/cubit/favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit(this.favoriteRepo) : super(FavoriteInitial());
  final FavoriteRepo favoriteRepo;

  final Set<int> _favoriteIds = {};

  bool isFavorite(int productId) => _favoriteIds.contains(productId);

  favorite() async {
    emit(FavoriteLoading());
    final response = await favoriteRepo.favorite();
    response.fold(
      (errMessage) => emit(FavoriteFailure(errMessage: errMessage)),
      (favoriteResponse) {
        _favoriteIds
          ..clear()
          ..addAll(favoriteResponse.list.map((e) => e.id));
        emit(FavoriteSuccess(favoritemodel: favoriteResponse.list));
      },
    );
  }

  addFavorite(int productId) async {
    emit(AddFavoriteLoading());
    final response = await favoriteRepo.addfavorite(productId);
    response.fold(
      (errMessage) => emit(AddFavoriteFailure(errMessage: errMessage)),
      (messageRes) {
        _favoriteIds.add(productId);
        emit(AddFavoriteSuccess(message: messageRes.message));
      },
    );
  }

  deleteFavorite(int productId) async {
    emit(DeleteFavoriteLoading());
    final response = await favoriteRepo.deleteFavorite(productId);
    response.fold(
      (errMessage) => emit(DeleteFavoriteFailure(errMessage: errMessage)),
      (messageRes) {
        _favoriteIds.remove(productId);
        emit(DeleteFavoriteSuccess(message: messageRes.message));
      },
    );
  }

  toggleFavorite(int productId) {
    if (_favoriteIds.contains(productId)) {
      deleteFavorite(productId);
    } else {
      addFavorite(productId);
    }
  }
}
