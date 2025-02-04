// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/movie/data/api/movie_api.dart' as _i627;
import '../../features/movie/data/data_sources/movie_remote_data_source.dart'
    as _i1024;
import '../../features/movie/domain/repositories/i_movie_repository.dart'
    as _i931;
import '../../features/movie/domain/repositories/movie_repository.dart'
    as _i224;
import '../../features/movie/domain/usecases/get_movie_detail_use_case.dart'
    as _i317;
import '../../features/movie/domain/usecases/get_popular_movies_use_case.dart'
    as _i573;
import '../../features/movie/domain/usecases/get_search_movies_use_case.dart'
    as _i853;
import '../../features/movie/domain/usecases/get_top_rated_movies_use_case.dart'
    as _i406;
import '../../features/movie/presentation/provider/movie_provider.dart'
    as _i511;

// initializes the registration of main-scope dependencies inside of GetIt
_i174.GetIt $initConfigInjection(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i526.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.lazySingleton<_i627.MovieApi>(() => _i627.MovieApi());
  gh.lazySingleton<_i511.MovieNotifier>(() => _i511.MovieNotifier());
  gh.factory<_i1024.MovieRemoteDataSource>(
      () => _i1024.MovieRemoteDataSource(movieApi: gh<_i627.MovieApi>()));
  gh.factory<_i931.IMovieRepository>(() => _i224.MovieRepository(
      movieRemoteDataSource: gh<_i1024.MovieRemoteDataSource>()));
  gh.factory<_i853.GetSearchMoviesUseCase>(() => _i853.GetSearchMoviesUseCase(
      iMovieRepository: gh<_i931.IMovieRepository>()));
  gh.factory<_i406.GetTopRatedMoviesUseCase>(() =>
      _i406.GetTopRatedMoviesUseCase(
          iMovieRepository: gh<_i931.IMovieRepository>()));
  gh.factory<_i573.GetPopularMoviesUseCase>(() => _i573.GetPopularMoviesUseCase(
      iMovieRepository: gh<_i931.IMovieRepository>()));
  gh.factory<_i317.GetMovieDetailUseCase>(() => _i317.GetMovieDetailUseCase(
      iMovieRepository: gh<_i931.IMovieRepository>()));
  return getIt;
}
