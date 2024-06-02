import 'package:dartz/dartz.dart' as dartz;
import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/movie_url_constant.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/features/movies/domain/entites/movie.dart';
import 'package:movie_app/features/movies/domain/repositories/movie_repository.dart';
import 'package:movie_app/features/movies/presentation/pages/movie_detail_page.dart';
import 'package:movie_app/injection_container.dart';

class PopularMovieCards extends StatelessWidget {
  const PopularMovieCards({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    MovieRepository movieRepository = sl<MovieRepository>();

    void onTapNavigateToDetailPage(BuildContext context, MovieEntity movie) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MovieDetailPage(movie: movie),
        ),
      );
    }

    return FutureBuilder<dartz.Either<Failure, List<MovieEntity>>>(
      future: movieRepository.getPopularMovies(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasData) {
          return snapshot.data!.fold(
            (l) => const Center(
              child: Text("Error"),
            ),
            (movies) => SizedBox(
              height: 250,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: movies.length,
                separatorBuilder: (context, index) {
                  return const SizedBox(width: 16);
                },
                itemBuilder: (context, index) {
                  final movie = movies[index];
                  return GestureDetector(
                    onTap: () {
                      onTapNavigateToDetailPage(context, movie);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      clipBehavior: Clip.hardEdge,
                      width: 250,
                      child: Image.network(
                        MovieUrlConstant.buildImageUrl(movie.backdropPath),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        } else {
          return const Center(
            child: Text("Error"),
          );
        }
      },
    );
  }
}
