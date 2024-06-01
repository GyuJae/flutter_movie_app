import 'dart:convert';

import 'package:movie_app/core/constants/movie_url_constant.dart';
import 'package:movie_app/features/movies/data/models/movie_model.dart';
import 'package:http/http.dart' as http;

abstract class MovieApiService {
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getNowPlayingMovies();
  Future<List<MovieModel>> getUpcomingMovies();
  Future<List<MovieModel>> getMovie(String id);
}

class MovieApiServiceImpl implements MovieApiService {
  final http.Client client;

  MovieApiServiceImpl(this.client);

  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final response = await client.get(
      Uri.parse(MovieUrlConstant.nowPlaying),
    );

    if (response.statusCode == 200) {
      final List<MovieModel> movies = [];
      final movieResults = jsonDecode(response.body)['results'];
      for (var movie in movieResults) {
        movies.add(MovieModel.fromJson(movie));
      }
      return movies;
    } else {
      throw Exception('인기 영화 서버 조회의 실패했습니다.');
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() {
    throw UnimplementedError();
  }

  @override
  Future<List<MovieModel>> getUpcomingMovies() {
    throw UnimplementedError();
  }

  @override
  Future<List<MovieModel>> getMovie(String id) {
    throw UnimplementedError();
  }
}
