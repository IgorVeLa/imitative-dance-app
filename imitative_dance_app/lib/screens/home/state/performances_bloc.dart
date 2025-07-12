import 'package:bloc/bloc.dart';
import 'package:imitative_dance_app/Repository/performance_repo.dart';
import 'package:imitative_dance_app/models/Performance.dart';
import 'package:imitative_dance_app/models/paginated_result.dart';
import 'package:meta/meta.dart';

part 'performances_event.dart';
part 'performances_state.dart';

class PerformancesBloc extends Bloc<PerformancesEvent, PerformancesState> {
  PerformanceRepo repo;
  PerformancesBloc({required this.repo}) : super(PerformancesInitial()) {
    on<PerformancesOpened>((event, emit) async {
      try {
        emit(PerformancesLoading());

        PaginatedResult<Performance> performances =
            await repo.getPerformances();

        emit(PerformancesLoaded(performances: performances));
      } catch (e) {
        emit(PerformancesError(message: e.toString()));
      }
    });
  }
}
