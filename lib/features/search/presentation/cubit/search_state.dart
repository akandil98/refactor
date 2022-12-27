part of 'search_cubit.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchInitial extends SearchState {}

class SearchIsLoading extends SearchState {}

class SearchLoaded extends SearchState {
  final SearchEntity searchEntity;

  const SearchLoaded({required this.searchEntity});
  @override
  List<Object> get props => [searchEntity];
}

class SearchError extends SearchState {
  final String msg;

  const SearchError({required this.msg});
  @override
  List<Object> get props => [msg];
}
