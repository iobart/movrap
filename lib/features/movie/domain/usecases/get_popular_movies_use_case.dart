import 'package:injectable/injectable.dart';
import 'package:movrap/features/movie/domain/models/movie.dart';
import 'package:movrap/features/movie/domain/repositories/i_movie_repository.dart';

@injectable
class GetPopularMoviesUseCase {
  final IMovieRepository  iMovieRepository;

  GetPopularMoviesUseCase({required this.iMovieRepository});

  Future<List<Movie>> invoke({int page = 1}) async {
    return await iMovieRepository.getPopularMovies(page: page);
  }
}