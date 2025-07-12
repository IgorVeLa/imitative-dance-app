part of 'performances_bloc.dart';

@immutable
sealed class PerformancesState {}

final class PerformancesInitial extends PerformancesState {}

final class PerformancesLoading extends PerformancesState {}

final class PerformancesLoaded extends PerformancesState {
  final PaginatedResult<Performance> performances;
  PerformancesLoaded({required this.performances});
}

final class PerformancesError extends PerformancesState {
  final String message;
  PerformancesError({required this.message});
}
