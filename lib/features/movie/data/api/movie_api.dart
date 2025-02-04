import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:movrap/core/paths/local_paths.dart';
import 'package:movrap/features/movie/domain/models/movie.dart';

@lazySingleton
class MovieApi {
  static final http.Client _client = http.Client();

  static Future<http.Response> get(String endpoint,
      {Map<String, String>? queryParameters}) async {
    final uri = Uri.https(
      'api.themoviedb.org',
      '/3/$endpoint',
      {
        'api_key': LocalAppPaths.endPointMovieDb,
        ...?queryParameters,
      },
    );
    return _client.get(uri);
  }

  Future<List<Movie>> getPopularMovies({int page = 1}) async {
    try {
      final response = await MovieApi.get(
        'movie/popular',
        queryParameters: {'page': page.toString()},
      );
//?language=es-ES&page
      if (response.statusCode == 200) {
        final movieResponse = MovieResponse.fromJson(
            json.decode(response.body) as Map<String, dynamic>);
        return movieResponse.results;
      } else {
        throw Exception('Failed to load movies: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load movies: $e');
    }
  }

  Future<List<Movie>> getTopRatedMovies({int page = 1}) async {
    try {
      final response = await MovieApi.get(
        'movie/top_rated',
        queryParameters: {'page': page.toString()},
      );

      if (response.statusCode == 200) {
        final movieResponse = MovieResponse.fromJson(
            json.decode(response.body) as Map<String, dynamic>);
        return movieResponse.results;
      } else {
        throw Exception('Failed to load movies: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load movies: $e');
    }
  }

  Future<List<Movie>> searchMovies(String query) async {
    try {
      final response = await MovieApi.get(
        'search/movie',
        queryParameters: {'query': query},
      );

      if (response.statusCode == 200) {
        final movieResponse = MovieResponse.fromJson(
            json.decode(response.body) as Map<String, dynamic>);
        return movieResponse.results;
      } else {
        throw Exception('Failed to search movies: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to search movies: $e');
    }
  }

  Future<Movie> getMovieDetails(int movieId) async {
    try {
      final response = await MovieApi.get('movie/$movieId');

      if (response.statusCode == 200) {
        return Movie.fromJson(
            json.decode(response.body) as Map<String, dynamic>);
      } else {
        throw Exception('Failed to load movie details: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load movie details: $e');
    }
  }
}
