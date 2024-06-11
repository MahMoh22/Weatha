part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class SearchOnChangeEvent extends SearchEvent {
  final String? text;
  const SearchOnChangeEvent(this.text);
}

class SearchDoneEvent extends SearchEvent {}

class ResetStateEvent extends SearchEvent {}
