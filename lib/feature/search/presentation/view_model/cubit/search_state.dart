part of 'search_cubit.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}
final class SearchLoading extends SearchState {}
final class Searchsuccess extends SearchState {
  final List<ProductSearch> search;

  Searchsuccess({required this.search});
}
final class SearchFailuer extends SearchState {
  final String errMessage;

  SearchFailuer({required this.errMessage});

}
