import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movie_app/features/movies/data/data_sources/local/in_memory_movie_repository.dart';
import 'package:movie_app/features/movies/domain/entites/movie.dart';
import 'package:movie_app/features/movies/domain/repositories/movie_repository.dart';
import 'package:movie_app/features/movies/domain/usecases/get_popular_movies.dart';

void main() {
  late GetPopularMoviesUseCase getCurrentMovieUseCase;
  late MovieRepository movieRepository;

  const movies = <MovieEntity>[
    MovieEntity(
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
    )
  ];

  setUp(() {
    movieRepository = InMemoryMovieRepository(movies);
    getCurrentMovieUseCase = GetPopularMoviesUseCase(movieRepository);
  });

  test("인기있는 영화 목록을 가져올 수 있습니다.", () async {
    final result = await getCurrentMovieUseCase.call();

    //then
    expect(result, const Right(movies));
  });
}
