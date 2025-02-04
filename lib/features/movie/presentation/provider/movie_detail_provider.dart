import 'package:movrap/features/movie/domain/repositories/movie_repository.dart';
import 'package:movrap/features/movie/domain/usecases/get_movie_detail_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';


final getMovieDetailUseCaseProvider = Provider<GetMovieDetailUseCase>((ref) {
  final movieRepository = ref.read(movieRepositoryProvider);
  return GetMovieDetailUseCase(iMovieRepository: movieRepository);
});