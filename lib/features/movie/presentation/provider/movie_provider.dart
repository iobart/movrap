import 'package:injectable/injectable.dart';
import 'package:movrap/features/movie/domain/models/movie.dart';
import 'package:movrap/features/movie/domain/usecases/get_movie_detail_use_case.dart';
import 'package:movrap/features/movie/domain/usecases/get_popular_movies_use_case.dart';
import 'package:movrap/features/movie/domain/usecases/get_search_movies_use_case.dart';
import 'package:movrap/features/movie/domain/usecases/get_top_rated_movies_use_case.dart';
import 'package:movrap/features/movie/presentation/provider/popular_movie_provider.dart';
import 'package:movrap/features/movie/presentation/provider/search_movie_provider.dart';
import 'package:movrap/features/movie/presentation/provider/top_rated_movie_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'movie_detail_provider.dart';

part 'movie_provider.g.dart';
@lazySingleton
@riverpod
class MovieNotifier extends _$MovieNotifier {
  late final GetPopularMoviesUseCase _getPopularMoviesUseCase;
  late final GetTopRatedMoviesUseCase _getTopRatedMoviesUseCase;
  late final GetSearchMoviesUseCase _getSearchMoviesUseCase;
  late final GetMovieDetailUseCase _getMovieDetailUseCase;

  @override
  FutureOr<List<Movie>> build() async {
    _getPopularMoviesUseCase = ref.read(getPopularMoviesUseCaseProvider);
    _getTopRatedMoviesUseCase =ref.read(getTopRatedMoviesUseCaseProvider);
    _getSearchMoviesUseCase = ref.read(getSearchMoviesUseCaseProvider);
    _getMovieDetailUseCase = ref.read(getMovieDetailUseCaseProvider);
    return _fetchPopularMovies();
  }

  Future<List<Movie>> _fetchPopularMovies({int page = 1}) async {
    return _getPopularMoviesUseCase.invoke(page: page);
  }

  Future<List<Movie>> _fetchTopRatedMovies({int page = 1}) async {
    return _getTopRatedMoviesUseCase.invoke(page: page);
  }

  Future<void> defaultMovies() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final movies = await _fetchPopularMovies();
      return movies;
    });
  }


  Future<void> loadTopRatedMovies() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final movies = await _fetchTopRatedMovies();
      return movies;
    });
  }

  Future<void> loadNextPage({bool isTopRated = false}) async {
    final currentState = state;
    state = await AsyncValue.guard(() async {
      final currentPage = (currentState.value?.length ?? 0) ~/ 20 + 1;
      final newMovies = isTopRated
          ? await _fetchTopRatedMovies(page: currentPage)
          : await _fetchPopularMovies(page: currentPage);
      return [...currentState.value ?? [], ...newMovies];
    });
  }

  Future<void> searchMovies(String query) async {
    state = const AsyncValue.loading();
    try {
      final movies = await _getSearchMoviesUseCase.invoke(query);
      state = AsyncValue.data(movies);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  Future<Movie> getMovieDetails(int movieId) async {
    return _getMovieDetailUseCase.invoke(movieId);
  }
}
