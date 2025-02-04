// features/movies/data/models/movie.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie.freezed.dart';
part 'movie.g.dart';



class DateTimeConverter implements JsonConverter<DateTime?, String?> {
  const DateTimeConverter();

  @override
  DateTime? fromJson(String? json) {
    if (json == null) return null;
    try {
      return DateTime.parse(json);
    } catch (e) {
      return null;
    }
  }

  @override
  String? toJson(DateTime? date) => date?.toIso8601String();
}

@freezed
class Movie with _$Movie {
  const factory Movie({
    required int id,
    required String title,
    String? overview,
    @JsonKey(name: 'poster_path') String? posterPath,
    @DateTimeConverter() @JsonKey(name: 'release_date') DateTime? releaseDate,
    @JsonKey(name: 'vote_average') double? voteAverage,
    @JsonKey(name: 'vote_count') int? voteCount,
    @JsonKey(name: 'genre_ids') List<int>? genreIds,
    double? popularity,
  }) = _Movie;

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
}

@freezed
class MovieResponse with _$MovieResponse {
  const factory MovieResponse({
    required int page,
    required List<Movie> results,
    @JsonKey(name: 'total_pages') required int totalPages,
    @JsonKey(name: 'total_results') required int totalResults,
  }) = _MovieResponse;

  factory MovieResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieResponseFromJson(json);
}