class MovieModel {
  final bool isAdult;
  final String backdropPath;
  final List<int> genreIds;
  final int id;
  final String originalLanguage;
  final String originalYitle;
  final String overview;
  final double popularity;
  final double posterPath;
  final double releaseDate;
  final double title;
  final double video;
  final double voteAverage;
  final double voteCount;

  MovieModel({
      required this.isAdult,
      required this.backdropPath,
      required this.genreIds,
      required this.id,
      required this.originalLanguage,
      required this.originalYitle,
      required this.overview,
      required this.popularity,
      required this.posterPath,
      required this.releaseDate,
      required this.title,
      required this.video,
      required this.voteAverage,
      required this.voteCount,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) =>

  @override
  String toString() {
    return
  }
}