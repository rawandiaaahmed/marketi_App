// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:flutter_application_1/feature/search/data/model/search_model.dart';
import 'package:flutter_application_1/feature/search/data/repo/search_repo.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo) : super(SearchInitial());
  final SearchRepo searchRepo;
  search(String query) async {
    emit(SearchLoading());
    final response = await searchRepo.searchproduct(query: query);
    response.fold(
      (errMessage) => emit(SearchFailuer(errMessage: errMessage)),
      (searchResponse) => emit(Searchsuccess(search: searchResponse.list)),
    );
  }
}
