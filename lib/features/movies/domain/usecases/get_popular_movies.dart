import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/features/movies/domain/entites/movie.dart';
import 'package:movie_app/features/movies/domain/repositories/movie_repository.dart';

class GetPopularMoviesUseCase {
  final MovieRepository _movieRepository;

  GetPopularMoviesUseCase(this._movieRepository);

  Future<Either<Failure, List<MovieEntity>>> execute() {
    return _movieRepository.getPopularMovies();
  }
}
