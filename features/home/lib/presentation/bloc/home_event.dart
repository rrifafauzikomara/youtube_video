import 'package:dependencies/equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

class SearchVideo extends HomeEvent {
  final String query;

  const SearchVideo({required this.query});

  @override
  List<Object?> get props => [query];
}
