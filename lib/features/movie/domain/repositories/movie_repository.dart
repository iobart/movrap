import 'package:injectable/injectable.dart';
import 'package:movrap/features/movie/data/api/movie_api.dart';
import 'package:movrap/features/movie/data/data_sources/movie_remote_data_source.dart';

import 'package:movrap/features/movie/domain/models/movie.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'i_movie_repository.dart';

part 'movie_repository.g.dart';

final movieApiProvider = Provider<MovieApi>((ref) {
  return MovieApi();
});

final movieRemoteDataSourceProvider = Provider<MovieRemoteDataSource>((ref) {
  final movieApi = ref.read(movieApiProvider);
  return MovieRemoteDataSource(movieApi: movieApi);
});

@riverpod
MovieRepository movieRepository(ref) {
  return MovieRepository(
      movieRemoteDataSource:
          MovieRemoteDataSource(movieApi: ref.read(movieApiProvider)));
}

@Injectable(as: IMovieRepository)
class MovieRepository implements IMovieRepository {
  final MovieRemoteDataSource movieRemoteDataSource;

  MovieRepository({required this.movieRemoteDataSource});

  @override
  Future<List<Movie>> getPopularMovies({int page = 1}) async {
    final List<Movie> movies =
        await movieRemoteDataSource.getPopularMovies(page: page);
    return movies;
  }

  @override
  Future<List<Movie>> getTopRatedMovies({int page = 1}) async {
    final List<Movie> movies =
        await movieRemoteDataSource.getTopRatedMovies(page: page);
    return movies;
  }

  @override
  Future<List<Movie>> searchMovies(String query) async {
    final List<Movie> movies = await movieRemoteDataSource.searchMovies(query);
    return movies;
  }

  @override
  Future<Movie> getMovieDetails(int movieId) async {
    final Movie movie = await movieRemoteDataSource.getMovieDetails(movieId);
    return movie;
  }
}
