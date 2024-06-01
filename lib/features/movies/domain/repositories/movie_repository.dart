import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/features/movies/domain/entites/movie.dart';

abstract class MovieRepository {
  Future<Either<Failure, List<MovieEntity>>> getPopularMovies();
  Future<Either<Failure, List<MovieEntity>>> getNowPlaying();
  Future<Either<Failure, List<MovieEntity>>> getComingSoon();
  Future<Either<Failure, MovieEntity>> getMovie(int id);
}
