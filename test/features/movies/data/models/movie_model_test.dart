import 'package:flutter_test/flutter_test.dart';
import 'package:movie_app/features/movies/data/models/movie_model.dart';
import 'package:movie_app/features/movies/domain/entites/movie.dart';

void main() {
  const movieModel = MovieModel(
    adult: false,
    backdropPath: "/fqv8v6AycXKsivp1T5yKtLbGXce.jpg",
    genreIds: [878, 12, 28],
    id: 653346,
    originalLanguage: "en",
    originalTitle: "Kingdom of the Planet of the Apes",
    overview:
        "Several generations in the future following Caesar's reign, apes are now the dominant species and live harmoniously while humans have been reduced to living in the shadows. As a new tyrannical ape leader builds his empire, one young ape undertakes a harrowing journey that will cause him to question all that he has known about the past and to make choices that will define a future for apes and humans alike.",
    popularity: 7113.603,
    posterPath: "/gKkl37BQuKTanygYQG1pyYgLVgf.jpg",
    releaseDate: "2024-05-08",
    title: "Kingdom of the Planet of the Apes",
    video: false,
    voteAverage: 7.006,
    voteCount: 703,
  );

  final json = <String, dynamic>{
    "adult": false,
    "backdrop_path": "/fqv8v6AycXKsivp1T5yKtLbGXce.jpg",
    "genre_ids": [878, 12, 28],
    "id": 653346,
    "original_language": "en",
    "original_title": "Kingdom of the Planet of the Apes",
    "overview":
        "Several generations in the future following Caesar's reign, apes are now the dominant species and live harmoniously while humans have been reduced to living in the shadows. As a new tyrannical ape leader builds his empire, one young ape undertakes a harrowing journey that will cause him to question all that he has known about the past and to make choices that will define a future for apes and humans alike.",
    "popularity": 7113.603,
    "poster_path": "/gKkl37BQuKTanygYQG1pyYgLVgf.jpg",
    "release_date": "2024-05-08",
    "title": "Kingdom of the Planet of the Apes",
    "video": false,
    "vote_average": 7.006,
    "vote_count": 703,
  };

  test("MovieModel은 MovieEntity의 서브클래스입니다", () {
    // when // then
    expect(movieModel, isA<MovieEntity>(),
        reason: "MovieModel이 MovieEntity의 서브클래스가 아닙니다");
  });

  test("JSON 데이터를 사용하여 MovieModel 객체를 생성할 수 있습니다", () {
    // when
    final movieFromJson = MovieModel.fromJson(json);

    // then
    expect(movieFromJson, isA<MovieModel>(),
        reason: "JSON 데이터로부터 MovieModel 객체를 생성하지 못했습니다");
  });

  test("MovieModel 객체를 JSON으로 변환할 수 있습니다", () {
    // when
    final movieToJson = movieModel.toJson();

    // then
    expect(movieToJson, json, reason: "MovieModel 객체를 JSON으로 변환하지 못했습니다");
  });
}
