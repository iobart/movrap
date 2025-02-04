import 'package:injectable/injectable.dart';
import 'package:movrap/features/movie/domain/models/movie.dart';
import 'package:movrap/features/movie/domain/repositories/i_movie_repository.dart';

@injectable
class GetSearchMoviesUseCase {
  final IMovieRepository  iMovieRepository;

  GetSearchMoviesUseCase({required this.iMovieRepository});

  Future<List<Movie>> invoke( String query) async {
    return await iMovieRepository.searchMovies(query);
  }
}