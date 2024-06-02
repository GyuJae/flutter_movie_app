import 'dart:convert';

import 'package:movie_app/core/constants/movie_url_constant.dart';
import 'package:movie_app/features/movies/data/models/movie_model.dart';
import 'package:http/http.dart' as http;

abstract class MovieApiService {
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getNowPlayingMovies();
  Future<List<MovieModel>> getUpcomingMovies();
  Future<MovieModel> getMovie(int id);
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
  Future<List<MovieModel>> getPopularMovies() async {
    final response = await client.get(
      Uri.parse(MovieUrlConstant.popular),
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
  Future<List<MovieModel>> getUpcomingMovies() async {
    final response = await client.get(
      Uri.parse(MovieUrlConstant.comingSoon),
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
  Future<MovieModel> getMovie(int id) async {
    final response = await client.get(
      Uri.parse(MovieUrlConstant.getMovieUrl(id)),
    );
    if (response.statusCode == 200) {
      return MovieModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('영화 상세정보 서버 조회의 실패했습니다.');
    }
  }
}
