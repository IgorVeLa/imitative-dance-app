import 'package:imitative_dance_app/models/Performance.dart';
import 'package:imitative_dance_app/models/paginated_result.dart';

abstract class PerformanceRepo {
  Future<Performance> getPerformance({required String id});
  Future<PaginatedResult<Performance>> getPerformances();
}
