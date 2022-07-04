part of 'home_cubit.dart';

enum HomeTab {
  overview,
  stats,
}

class HomeState extends Equatable {
  const HomeState({this.tab = HomeTab.overview});

  final HomeTab tab;
  @override
  List<Object?> get props => [tab];
}
