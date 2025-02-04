import 'package:injectable/injectable.dart';
import 'package:movrap/features/movie/data/api/movie_api.dart';
import 'package:movrap/features/movie/domain/models/movie.dart';

@injectable
class MovieRemoteDataSource {
  final MovieApi movieApi;

 MovieRemoteDataSource({required this.movieApi});

  Future<List<Movie>> getPopularMovies({int page = 1}) async {
    try {
      final List<Movie> movies = await movieApi.getPopularMovies(page: page);
      return movies;
    } catch (e) {
      throw Exception('Failed to load  popular movies: $e');
    }
  }

  Future<List<Movie>> getTopRatedMovies({int page = 1}) async {
    try {
      final List<Movie> movies = await movieApi.getTopRatedMovies(page: page);
      return movies;
    } catch (e) {
      throw Exception('Failed to load  TopRated movies: $e');
    }
  }

  Future<List<Movie>> searchMovies(String query) async {
    try {
      final List<Movie> movies = await movieApi.searchMovies(query);
      return movies;
    } catch (e) {
      throw Exception('Failed to search movies: $e');
    }
  }

  Future<Movie> getMovieDetails(int movieId) async {
    try {
      final Movie movie = await movieApi.getMovieDetails(movieId);
      return movie;
    } catch (e) {
      throw Exception('Failed to load movie details: $e');
    }
  }
}
