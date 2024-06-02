import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/features/movies/data/data_sources/remote/movie_api_service.dart';
import 'package:movie_app/features/movies/data/models/movie_model.dart';
import 'package:movie_app/features/movies/domain/repositories/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieApiService _apiService;

  MovieRepositoryImpl(this._apiService);

  @override
  Future<Either<Failure, List<MovieModel>>> getComingSoon() async {
    try {
      final movies = await _apiService.getUpcomingMovies();
      return Right(movies);
    } catch (e) {
      return Left(ServerFailure(
        message: e.toString(),
      ));
    }
  }

  @override
  Future<Either<Failure, MovieModel>> getMovie(int id) async {
    try {
      final movie = await _apiService.getMovie(id);
      return Right(movie);
    } catch (e) {
      return Left(ServerFailure(
        message: e.toString(),
      ));
    }
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
  Future<Either<Failure, List<MovieModel>>> getPopularMovies() async {
    try {
      final movies = await _apiService.getPopularMovies();
      return Right(movies);
    } catch (e) {
      return Left(ServerFailure(
        message: e.toString(),
      ));
    }
  }
}
