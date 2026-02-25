class Film {
  final String id;
  final String title;
  final String description;
  final String director;
  final String producer;
  final String releaseDate;
  final String image;
  final String movieBanner;

  Film({
    required this.id,
    required this.title,
    required this.description,
    required this.director,
    required this.producer,
    required this.releaseDate,
    required this.image,
    required this.movieBanner,
  });

  factory Film.fromJson(Map<String, dynamic> json) {
    return Film(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      director: json['director'] as String,
      producer: json['producer'] as String,
      releaseDate: json['release_date'] as String,
      image: json['image'] as String? ?? '',
      movieBanner: json['movie_banner'] as String? ?? '',
    );
  }
}
