import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/features/movies/data/data_sources/remote/movie_api_service.dart';
import 'package:movie_app/features/movies/data/repositories/movie_repository_impl.dart';
import 'package:movie_app/features/movies/domain/repositories/movie_repository.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // repositories
  sl.registerLazySingleton<MovieRepository>(() => MovieRepositoryImpl(sl()));

  // data sources
  sl.registerLazySingleton<MovieApiService>(() => MovieApiServiceImpl(sl()));

  // external
  sl.registerLazySingleton(() => http.Client());
}
