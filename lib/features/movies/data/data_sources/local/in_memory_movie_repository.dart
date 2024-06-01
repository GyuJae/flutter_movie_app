import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/features/movies/domain/entites/movie.dart';
import 'package:movie_app/features/movies/domain/repositories/movie_repository.dart';

class InMemoryMovieRepository implements MovieRepository {
  final List<MovieEntity> movies;

  InMemoryMovieRepository(this.movies);

  @override
  Future<Either<Failure, List<MovieEntity>>> getPopularMovies() async {
    return Right(movies);
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> getNowPlaying() async {
    return Right(movies);
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> getComingSoon() async {
    return Right(movies);
  }

  @override
  Future<Either<Failure, MovieEntity>> getMovie(int id) async {
    return Right(movies.firstWhere((movie) => movie.id == id));
  }
}
