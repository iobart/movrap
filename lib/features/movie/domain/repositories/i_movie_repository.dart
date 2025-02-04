import 'package:movrap/features/movie/domain/models/movie.dart';

abstract class IMovieRepository {

  Future<List<Movie>> getPopularMovies({int page = 1});

  Future<List<Movie>> getTopRatedMovies({int page = 1});

  Future<List<Movie>> searchMovies(String query);

  Future<Movie> getMovieDetails(int movieId);
}