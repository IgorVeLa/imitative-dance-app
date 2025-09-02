class Performance {
  String? id;
  String? title;
  DateTime? date;
  double? overallSimilarityScore;
  Map<String, dynamic>? similarityScores;
  Uri? userVideoUrl;
  Uri? referenceVideoUrl;
  Duration? videoDuration;
  Uri? thumbnail;

  Performance({
    this.id,
    this.title,
    this.date,
    this.overallSimilarityScore,
    this.similarityScores,
    this.userVideoUrl,
    this.referenceVideoUrl,
    this.videoDuration,
    this.thumbnail,
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
      videoDuration: json['videoDuration'],
      thumbnail: json['thumbnail'],
    );
  }
}
