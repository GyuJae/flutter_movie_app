class MovieUrlConstant {
  static const String baseUrl = 'https://movies-api.nomadcoders.workers.dev';
  static const String popular = '$baseUrl/popular';
  static const String nowPlaying = '$baseUrl/now-playing';
  static const String comingSoon = '$baseUrl/coming-soon';

  static String getMovieUrl(int id) => '$baseUrl/movie?id=$id';

  static String buildImageUrl(String path) =>
      'https://image.tmdb.org/t/p/w500/$path';
}
