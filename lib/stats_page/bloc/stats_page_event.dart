part of 'stats_page_bloc.dart';

abstract class StatsPageEvent extends Equatable {
  const StatsPageEvent();
  @override
  List<Object> get props => [];
}

class StatsPageSubscriptionRequested extends StatsPageEvent {
  const StatsPageSubscriptionRequested();
}

class StatsPageFilterChanged extends StatsPageEvent {
  const StatsPageFilterChanged();
}

class StatsPageDateUpdated extends StatsPageEvent {
  const StatsPageDateUpdated();
}
