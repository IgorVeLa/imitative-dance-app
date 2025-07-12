import 'package:imitative_dance_app/Repository/performance_repo.dart';
import 'package:imitative_dance_app/models/Performance.dart';
import 'package:imitative_dance_app/models/paginated_result.dart';

List<Performance> mockPerformances = [
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
    videoDuration: Duration(minutes: 1),
    thumbnail: Uri.parse('https://placehold.co/120x150'),
  ),
  Performance(
    id: "2",
    title: "Bada Lee choreography",
    date: DateTime.now(),
    overallSimilarityScore: 60.0,
    similarityScores: {
      "torso_score": 62.0,
      "right_arm_score": 55.0,
      "left_arm_score": 58.0,
      "left_leg_score": 61.0,
      "right_leg_score": 64.0,
    },
    videoDuration: Duration(minutes: 1, seconds: 23),
    thumbnail: Uri.parse('https://placehold.co/120x150'),
  ),
  Performance(
    id: "3",
    title: "Ryusei Harada choreography",
    date: DateTime.now(),
    overallSimilarityScore: 45.0,
    similarityScores: {
      "torso_score": 47.0,
      "right_arm_score": 43.0,
      "left_arm_score": 42.0,
      "left_leg_score": 46.0,
      "right_leg_score": 47.0,
    },
    videoDuration: Duration(seconds: 42),
    thumbnail: Uri.parse('https://placehold.co/120x150'),
  ),
];

class PerformanceRepoMock implements PerformanceRepo {
  @override
  Future<PaginatedResult<Performance>> getPerformances() async {
    return PaginatedResult(
      items: mockPerformances,
      currentPage: 1,
      totalPages: 1,
      totalItems: mockPerformances.length,
    );
  }

  @override
  Future<Performance> getPerformance({required String id}) async {
    return mockPerformances[int.parse(id)];
  }
}
