import 'package:dartz/dartz.dart' as dartz;
import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/movie_url_constant.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/features/movies/domain/entites/movie.dart';
import 'package:movie_app/features/movies/domain/repositories/movie_repository.dart';
import 'package:movie_app/injection_container.dart';

class ComingSoonMovieCards extends StatelessWidget {
  const ComingSoonMovieCards({super.key});

  @override
  Widget build(BuildContext context) {
    MovieRepository movieRepository = sl<MovieRepository>();

    return FutureBuilder<dartz.Either<Failure, List<MovieEntity>>>(
      future: movieRepository.getComingSoon(),
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
              height: 270,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: movies.length,
                separatorBuilder: (context, index) {
                  return const SizedBox(width: 16);
                },
                itemBuilder: (context, index) {
                  final movie = movies[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        clipBehavior: Clip.hardEdge,
                        width: 200,
                        height: 200,
                        child: Image.network(
                          MovieUrlConstant.buildImageUrl(movie.posterPath),
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        width: 170,
                        child: Text(
                          movie.title,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.ellipsis,
                          ),
                          maxLines: 2,
                        ),
                      ),
                    ],
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
