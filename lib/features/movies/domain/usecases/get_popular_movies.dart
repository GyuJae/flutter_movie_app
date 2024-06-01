import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/core/usecases/usecase.dart';
import 'package:movie_app/features/movies/domain/entites/movie.dart';
import 'package:movie_app/features/movies/domain/repositories/movie_repository.dart';

class GetPopularMoviesUseCase implements UseCase<List<MovieEntity>, void> {
  final MovieRepository _movieRepository;

  GetPopularMoviesUseCase(this._movieRepository);

  @override
  Future<Either<Failure, List<MovieEntity>>> call({void params}) {
    return _movieRepository.getPopularMovies();
  }
}
