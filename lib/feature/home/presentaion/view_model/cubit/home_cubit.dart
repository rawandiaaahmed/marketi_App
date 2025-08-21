import 'package:flutter_application_1/feature/home/data/model/brands_model.dart';
import 'package:flutter_application_1/feature/home/data/model/category_model.dart';
import 'package:flutter_application_1/feature/home/data/model/product_details_modecategory.dart';
import 'package:flutter_application_1/feature/home/data/model/product_details_model_brands.dart';

import 'package:flutter_application_1/feature/home/data/model/product_model.dart';
import 'package:flutter_application_1/feature/home/data/repo/product_repository.dart';
import 'package:flutter_application_1/feature/home/presentaion/view_model/cubit/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepository) : super(HomeInitial());

  final HomeRepository homeRepository;

  int limitproduct = 10;
  int skipproduct = 0;
  bool producthasMore = true;

  List<ProductModel> products = [];

  int limitproductbycategory = 10;
  int skipproductbycategory = 0;
  bool producthasMorebycategory = true;

  List<ProductModelBycategory> productsbycategory = [];

  int limitproductbybrand = 10;
  int skipproductbybrand = 0;
  bool producthasMorebybrand = true;

  List<ProductModelByBrands> productsbybrand = [];


  bool categoryhasMore = true;
  int limitcategory = 10;
  int skipcategory = 0;
  List<CategoryModel> categories = [];


  bool brandshasMore = true;
  int limitbrand = 10;
  int skipbrand = 0;
  List<BrandsModel> brands = [];


  final Set<int> favoriteIds = {};
  final Set<int> cartIds = {};

  Future<void> getProduct({bool isLoadMore = false}) async {
    if (isLoadMore && !producthasMore) return;
    if (!isLoadMore) {
      skipproduct = 0;
      producthasMore = true;
      products.clear();
      emit(GetProductLoading());
    }

    final response = await homeRepository.getProduct(
      limit: limitproduct,
      skip: skipproduct,
    );

    response.fold(
      (errMessage) => emit(GetProductFailure(errMessage: errMessage)),
      (ProductResponse) {
        if (ProductResponse.list.isEmpty) {
          producthasMore = false;
        } else {
          products.addAll(ProductResponse.list);
        }

        skipproduct += limitproduct;

        emit(GetProductSuccess(product: products));
      },
    );
  }

  void toggleFavorite(ProductModel product) {
    if (favoriteIds.contains(product.id)) {
      favoriteIds.remove(product.id);
    } else {
      favoriteIds.add(product.id);
    }
    emit(GetProductSuccess(product: products,));
  }

  void addToCart(ProductModel product) {
    cartIds.add(product.id);
    emit(GetProductSuccess(product: products));
  }
  //category

  Future<void> getCategories({bool isLoadMore = false}) async {
    if (isLoadMore && !categoryhasMore) return;
    if (!isLoadMore) {
      skipcategory = 0;
      categoryhasMore = true;
      categories.clear();
      emit(GetCategoryLoading());
    }

    final response = await homeRepository.getCategory(
      limit: limitcategory,
      skip: skipcategory,
    );

    response.fold(
      (errMessage) => emit(GetCategoryFailure(errMessage: errMessage)),
      ( categoryResponse) {
        if (categoryResponse.list.isEmpty) {
          categoryhasMore = false;
        } else {
          categories.addAll(categoryResponse.list);
        }

        skipcategory += limitcategory;

        emit(GetCategorySuccess(categories: categories));
      },
    );
  }
  Future<void> getBrands({bool isLoadMore = false}) async {
    if (isLoadMore && !brandshasMore) return;
    if (!isLoadMore) {
      skipbrand = 0;
      brandshasMore = true;
      brands.clear();
      emit(GetBrandLoading());
    }

    final response = await homeRepository.getbrands(
      limit: limitbrand,
      skip: skipbrand,
    );

    response.fold(
      (errMessage) => emit(GetBrandFailure(errMessage: errMessage)),
      (BrandsResponse) {
        if (BrandsResponse.list.isEmpty) {
          brandshasMore = false;
        } else {
          brands.addAll(BrandsResponse.list);
        }

        skipbrand += limitbrand;

        emit(GetBrandSuccess(brands: brands));
      },
    );
  }
 Future<void> getProductbycategory({
    required String category,
    bool isLoadMore = false,
  }) async {
    if (isLoadMore && !producthasMorebycategory) return;

    if (!isLoadMore) {
      skipproductbycategory = 0;
      producthasMorebycategory = true;
      productsbycategory.clear();
      emit(GetProductbycategoryLoading());
    }

    final response = await homeRepository.getProductbycategory(
      category: category,
      skip: skipproductbycategory,
      limit: limitproductbycategory,
    );

    response.fold(
      (errMessage) => emit(GetProductbycategoryFailure(errMessage: errMessage)),
      (productResponse) {
        if (productResponse.list.isEmpty) {
          producthasMorebycategory = false;
        } else {
          productsbycategory.addAll(productResponse.list);
          skipproductbycategory += limitproductbycategory;
        }
        emit(GetProductbycategorySuccess(products: productsbycategory));
      },
    );
  }
 Future<void> getProductbyBrand({
    required String brand,
    bool isLoadMore = false,
  }) async {
    if (isLoadMore && !producthasMorebybrand) return;

    if (!isLoadMore) {
      skipproductbybrand = 0;
      producthasMorebybrand = true;
      productsbybrand.clear();
      emit(GetProductbyBrandLoading());
    }

    final response = await homeRepository.getProductbyBrands(
     brands: brand,
      skip: skipproductbybrand,
      limit: limitproductbybrand,
    );

    response.fold(
      (errMessage) => emit(GetProductbyBrandFailure(errMessage: errMessage)),
      (productResponseByBrands) {
        if (productResponseByBrands.list.isEmpty) {
          producthasMorebybrand = false;
        } else {
          productsbybrand.addAll(productResponseByBrands.list);
          skipproductbybrand += limitproductbybrand;
        }
        emit(GetProductbyBrandSuccess(productBrand: productsbybrand));
      },
    );
  }


  bool isFavorite(ProductModel product) => favoriteIds.contains(product.id);
  bool isInCart(ProductModel product) => cartIds.contains(product.id);
}

