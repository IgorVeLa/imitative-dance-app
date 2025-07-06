class Performance {
  String? id;
  String? title;
  DateTime? date;
  double? overallSimilarityScore;
  Map<String, dynamic>? similarityScores;
  Uri? userVideoUrl;
  Uri? referenceVideoUrl;

  Performance({
    this.id,
    this.title,
    this.date,
    this.overallSimilarityScore,
    this.similarityScores,
    this.userVideoUrl,
    this.referenceVideoUrl,
  });

  factory Performance.fromJson(Map<String, dynamic> json) {
    return Performance(
      id: json['id'],
      title: json['title'],
      date: json['date'],
      overallSimilarityScore: json['overallSimilarityScore'],
      similarityScores: json['similarityScores'],
      userVideoUrl: json['userVideoUrl'],
      referenceVideoUrl: json['referenceVideoUrl'],
    );
  }
}
