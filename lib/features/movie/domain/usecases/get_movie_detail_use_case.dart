import 'package:injectable/injectable.dart';
import 'package:movrap/features/movie/domain/models/movie.dart';
import 'package:movrap/features/movie/domain/repositories/i_movie_repository.dart';

@injectable
class GetMovieDetailUseCase {
  final IMovieRepository  iMovieRepository;

  GetMovieDetailUseCase({required this.iMovieRepository});

  Future<Movie> invoke( int movieId) async {
    return await iMovieRepository.getMovieDetails(movieId);
  }
}