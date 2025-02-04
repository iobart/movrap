import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movrap/features/movie/domain/models/movie.dart';
import 'package:movrap/features/movie/domain/repositories/movie_repository.dart';
import 'package:movrap/features/movie/presentation/screens/detail_screen.dart';

import 'detail_screen.mocks.dart';

@GenerateMocks([MovieRepository])
void main() {
  late MockMovieRepository mockMovieRepository;

  setUp(() {
    mockMovieRepository = MockMovieRepository();
  });

  testWidgets('MovieDetailScreen shows movie details',
      (WidgetTester tester) async {
    final movie = Movie(
      id: 1241982,
      title: 'Moana 2',
      posterPath: '/aLVkiINlIeCkcZIzb7XHzPYgO6L.jpg',
      releaseDate: DateTime(2024, 11, 21),
      voteAverage: 8.5,
      overview:
          'After receiving an unexpected call from her wayfinding ancestors, Moana journeys alongside Maui and a new crew to the far seas of Oceania and into dangerous, long-lost waters for an adventure unlike anything shes ever faced..',
    );

    when(mockMovieRepository.getMovieDetails(1241982))
        .thenAnswer((_) async => movie);

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          movieDetailProvider.overrideWithProvider(
            (movieId) => FutureProvider((ref) async => movie),
          ),
        ],
        child: MaterialApp(
          home: MovieDetailScreen(movieId: 1241982),
        ),
      ),
    );

    await tester.pump();

    expect(find.text('Moana 2'), findsOneWidget);
  });
}
