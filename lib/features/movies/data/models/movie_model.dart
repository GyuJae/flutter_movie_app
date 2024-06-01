import 'package:movie_app/features/movies/domain/entites/movie.dart';

class MovieModel extends MovieEntity {
  const MovieModel({
    required super.adult,
    required super.backdropPath,
    required super.genreIds,
    required super.id,
    required super.originalLanguage,
    required super.originalTitle,
    required super.overview,
    required super.popularity,
    required super.posterPath,
    required super.releaseDate,
    required super.title,
    required super.video,
    required super.voteAverage,
    required super.voteCount,
  });

  factory MovieModel.fromJson(Map<String, dynamic> map) {
    return MovieModel(
      adult: map['adult'],
      backdropPath: map['backdrop_path'],
      genreIds: List<int>.from(map['genre_ids']),
      id: map['id'],
      originalLanguage: map['original_language'],
      originalTitle: map['original_title'],
      overview: map['overview'],
      popularity: map['popularity'],
      posterPath: map['poster_path'],
      releaseDate: map['release_date'],
      title: map['title'],
      video: map['video'],
      voteAverage: map['vote_average'],
      voteCount: map['vote_count'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'adult': super.adult,
      'backdrop_path': super.backdropPath,
      'genre_ids': super.genreIds,
      'id': super.id,
      'original_language': super.originalLanguage,
      'original_title': super.originalTitle,
      'overview': super.overview,
      'popularity': super.popularity,
      'poster_path': super.posterPath,
      'release_date': super.releaseDate,
      'title': super.title,
      'video': super.video,
      'vote_average': super.voteAverage,
      'vote_count': super.voteCount,
    };
  }
}
