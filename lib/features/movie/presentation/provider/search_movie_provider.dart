import 'package:movrap/features/movie/domain/repositories/movie_repository.dart';
import 'package:movrap/features/movie/domain/usecases/get_search_movies_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';


final getSearchMoviesUseCaseProvider = Provider<GetSearchMoviesUseCase>((ref) {
  final movieRepository = ref.read(movieRepositoryProvider);
  return GetSearchMoviesUseCase(iMovieRepository: movieRepository);
});