import 'package:movrap/features/movie/domain/repositories/movie_repository.dart';
import 'package:movrap/features/movie/domain/usecases/get_popular_movies_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';


final getPopularMoviesUseCaseProvider = Provider<GetPopularMoviesUseCase>((ref) {
  final movieRepository = ref.read(movieRepositoryProvider);
  return GetPopularMoviesUseCase(iMovieRepository: movieRepository);
});