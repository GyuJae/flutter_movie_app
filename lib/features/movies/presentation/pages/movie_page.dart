import 'package:flutter/material.dart';
import 'package:movie_app/features/movies/presentation/widgets/coming_soon_movie_cards.dart';
import 'package:movie_app/features/movies/presentation/widgets/now_playing_movie_cards.dart';
import 'package:movie_app/features/movies/presentation/widgets/popular_movie_cards.dart';

class MoviePage extends StatelessWidget {
  const MoviePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 16,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "인기 영화",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16),
                PopularMovieCards(),
                SizedBox(height: 16),
                Text(
                  "현재 상영 중인 영화",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16),
                NowPlayingMovieCards(),
                Text(
                  "개봉 예정인 영화",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16),
                ComingSoonMovieCards(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
