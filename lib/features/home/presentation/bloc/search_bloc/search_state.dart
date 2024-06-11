part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchInitial extends SearchState {}

class SearchLoadingState extends SearchState {}

class SearchSuccessState extends SearchState {
  final List<Search>? searchList;
  const SearchSuccessState(this.searchList);
}

class SearchFailureState extends SearchState {
  final String message;
  const SearchFailureState(this.message);
}

class SearchDoneState extends SearchState {
  
}
