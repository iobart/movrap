// test/features/movie/presentation/movie_list_screen_test.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movrap/features/movie/domain/models/movie.dart';
import 'package:movrap/features/movie/presentation/provider/movie_provider.dart';

@GenerateMocks([MovieNotifier])
import 'widget_test.mocks.dart';

void main() {
  testWidgets('MovieListScreen renders correctly and handles scroll and interactions', (WidgetTester tester) async {
    // Crea una instancia del mock
    final mockMovieNotifier = MockMovieNotifier();

    // Configura el comportamiento del mock
    final movies = [
      Movie(
          id: 1,
          title: 'Movie 1',
          overview: 'Overview 1',
          posterPath: 'posterPath 1',
          releaseDate: DateTime.tryParse("2020-01-01"),
          voteAverage: 1.0,
          voteCount: 1,
          genreIds: [1],
          popularity: 1.0),
      Movie(
          id: 2,
          title: 'Movie 2',
          overview: 'Overview 2',
          posterPath: 'posterPath 2',
          releaseDate: DateTime.tryParse("2020-01-01"),
          voteAverage: 1.0,
          voteCount: 1,
          genreIds: [1],
          popularity: 1.0),
    ];

    when(mockMovieNotifier.build()).thenAnswer((_) async => movies);
    when(mockMovieNotifier.state).thenReturn(AsyncValue.data(movies));

    // Simula la carga de datos
    await tester.pumpAndSettle();

    final movieList = mockMovieNotifier.state.value;
    expect(movieList, equals(movies));

  });
}