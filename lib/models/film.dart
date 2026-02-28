class Film {
  final String id;
  final String title;
  final String originalTitle;
  final String originalTitleRomanised;
  final String description;
  final String director;
  final String producer;
  final String releaseDate;
  final String running_time;
  final String rt_score;

  Film({
    required this.id,
    required this.title,
    required this.originalTitle,
    required this.originalTitleRomanised,
    required this.description,
    required this.director,
    required this.producer,
    required this.releaseDate,
    required this.running_time,
    required this.rt_score,
  });

  factory Film.fromJson(Map<String, dynamic> json) {
    return Film(
      id: json['id'] as String,
      title: json['title'] as String,
      originalTitle: json['original_title'] as String,
      originalTitleRomanised: json['original_title_romanised'] as String,
      description: json['description'] as String,
      director: json['director'] as String,
      producer: json['producer'] as String,
      releaseDate: json['release_date'] as String,
      running_time: json['running_time'] as String,
      rt_score: json['rt_score'] as String,
    );
  }
}
