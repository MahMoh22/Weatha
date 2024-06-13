import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_weather/core/di/di.dart';
import 'package:my_weather/core/helper/app_perfs.dart';
import 'package:my_weather/features/home/domain/entities/search.dart';
import 'package:my_weather/features/home/domain/usecases/search_city_usecase.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final AppPreferences appPreferences = instance();

  final SearchCityUsecase searchCityUsecase;

  SearchBloc({
    required this.searchCityUsecase,
  }) : super(SearchInitial()) {
    on<SearchEvent>((event, emit) async {
      if (event is SearchDoneEvent) {
        emit(SearchDoneState());
      } else if (event is SearchOnChangeEvent) {
        if (event.text != null && event.text!.length > 2) {
          emit(SearchLoadingState());
          (await searchCityUsecase.excute()).fold(
              (failure) => emit(SearchFailureState(failure.message)),
              (data) => emit(SearchSuccessState(data)));
        }
      } else if (event is ResetStateEvent) {
        emit(SearchInitial());
      }
    });
  }
}
