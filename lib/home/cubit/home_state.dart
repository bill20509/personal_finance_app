part of 'home_cubit.dart';

enum HomeTab {
  overview,
  stats,
  user,
}

class HomeState extends Equatable {
  const HomeState({this.tab = HomeTab.overview});

  final HomeTab tab;
  @override
  List<Object?> get props => [tab];
}
