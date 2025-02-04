import 'package:movrap/features/movie/domain/repositories/movie_repository.dart';
import 'package:movrap/features/movie/domain/usecases/get_top_rated_movies_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';


final getTopRatedMoviesUseCaseProvider = Provider<GetTopRatedMoviesUseCase>((ref) {
  final movieRepository = ref.read(movieRepositoryProvider);
  return GetTopRatedMoviesUseCase(iMovieRepository: movieRepository);
});