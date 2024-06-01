import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/features/movies/data/data_sources/remote/movie_api_service.dart';
import 'package:movie_app/features/movies/data/models/movie_model.dart';
import 'package:movie_app/features/movies/domain/repositories/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieApiService _apiService;

  MovieRepositoryImpl(this._apiService);

  @override
  Future<Either<Failure, List<MovieModel>>> getComingSoon() {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, MovieModel>> getMovie(int id) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<MovieModel>>> getNowPlaying() async {
    try {
      final movies = await _apiService.getNowPlayingMovies();
      return Right(movies);
    } catch (e) {
      return Left(ServerFailure(
        message: e.toString(),
      ));
    }
  }

  @override
  Future<Either<Failure, List<MovieModel>>> getPopularMovies() {
    throw UnimplementedError();
  }
}
