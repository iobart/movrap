import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movrap/features/movie/domain/repositories/movie_repository.dart';
import 'package:movrap/features/movie/domain/models/movie.dart';

class MovieDetailScreen extends ConsumerWidget {
  final int movieId;

  const MovieDetailScreen({super.key, required this.movieId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movieAsync = ref.watch(movieDetailProvider(movieId));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie Details',style: TextStyle(color: Colors.white)),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.purple],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: movieAsync.when(
        loading: () => const Center(
          child: SizedBox(
            width: 50,
            height: 50,
            child: CircularProgressIndicator(),
          ),
        ),
        error: (error, stack) => Center(child: Text('Error: $error')),
        data: (movie) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: CachedNetworkImage(
                          imageUrl: 'https://image.tmdb.org/t/p/w300${movie.posterPath}',
                          placeholder: (context, url) => const SizedBox(
                            width: 50,
                            height: 50,
                            child: CircularProgressIndicator(),
                          ),
                          errorWidget: (context, url, error) => const Icon(Icons.error),
                          width: 300,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        movie.title,
                        style: Theme.of(context).textTheme.headlineSmall,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Release Date: ${movie.releaseDate?.toLocal().toIso8601String() ?? 'N/A'}',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.star, color: Colors.amber, size: 24),
                          const SizedBox(width: 5),
                          Text(
                            movie.voteAverage?.toStringAsFixed(1) ?? 'N/A',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Text(
                        movie.overview ?? 'No overview available',
                        style: Theme.of(context).textTheme.bodyMedium,
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

final movieDetailProvider =
FutureProvider.family<Movie, int>((ref, movieId) async {
  final movieRepository = ref.read(movieRepositoryProvider);
  return movieRepository.getMovieDetails(movieId);
});