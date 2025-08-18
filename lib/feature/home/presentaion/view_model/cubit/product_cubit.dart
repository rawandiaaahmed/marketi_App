import 'package:flutter_application_1/feature/home/data/model/product_model.dart';
import 'package:flutter_application_1/feature/home/data/repo/product_repository.dart';
import 'package:flutter_application_1/feature/home/presentaion/view_model/cubit/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this.productRepository) : super(ProductInitial());

  final ProductRepository productRepository;

  int limit = 10;
  int skip = 0;
  bool hasMore = true;

  List<ProductModel> products = [];
  final Set<int> favoriteIds = {};
  final Set<int> cartIds = {};

  Future<void> getProduct({bool loadMore = false}) async {
    if (loadMore && !hasMore) return;

    emit(GetProductLoading());

    final response = await productRepository.getProduct(
      limit: limit,
      skip: skip,
    );

    response.fold(
      (errMessage) => emit(GetProductFailure(errMessage: errMessage)),
      (productResponse) {
        if (loadMore) {
          products.addAll(productResponse.list);
        } else {
          products = productResponse.list;
        }

        skip += limit;
        hasMore = products.length < productResponse.total;

        emit(GetProductSuccess(product: products, hasMore: hasMore));
      },
    );
  }
  void toggleFavorite(ProductModel product) {
    if (favoriteIds.contains(product.id)) {
      favoriteIds.remove(product.id);
    } else {
      favoriteIds.add(product.id);
    }
    emit(GetProductSuccess(product: products, hasMore: hasMore));
  }

  void addToCart(ProductModel product) {
    cartIds.add(product.id);
    emit(GetProductSuccess(product: products, hasMore: hasMore));
  }

  bool isFavorite(ProductModel product) => favoriteIds.contains(product.id);
  bool isInCart(ProductModel product) => cartIds.contains(product.id);
}