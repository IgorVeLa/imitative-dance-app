import 'package:imitative_dance_app/Repository/performance_repo.dart';
import 'package:imitative_dance_app/models/Performance.dart';
import 'package:imitative_dance_app/models/paginated_result.dart';

class PerformanceRepoMock implements PerformanceRepo {
  @override
  Future<PaginatedResult<Performance>> getPerformances() async {
    return PaginatedResult(items: [
      Performance(
        id: "1",
        title: "Rena choreography",
        date: DateTime.now(),
        overallSimilarityScore: 87.5,
        similarityScores: {
          "torso_score": 90.0,
          "right_arm_score": 85.0,
          "left_arm_score": 88.0,
          "left_leg_score": 87.5,
          "right_leg_score": 87.0,
        },
      ),
    ], currentPage: 1, totalPages: 1, totalItems: 1);
  }

  @override
  Future<Performance> getPerformance({required String id}) {
    // TODO: implement getPerformance
    throw UnimplementedError();
  }
}
