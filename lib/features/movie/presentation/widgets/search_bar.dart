import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movrap/features/movie/presentation/provider/movie_provider.dart';

class MovieSearchWidget extends ConsumerStatefulWidget {
  const MovieSearchWidget({super.key});

  @override
  MovieSearchWidgetState createState() => MovieSearchWidgetState();
}

class MovieSearchWidgetState extends ConsumerState<MovieSearchWidget> {
  final TextEditingController _searchController = TextEditingController();
  Timer? _debounce;

  @override
  void dispose() {
    _debounce?.cancel();
    _searchController.dispose();
    super.dispose();
  }


  void _onSearchChanged() {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(seconds: 3), () {
      if (_searchController.text.isEmpty) {
        ref.read(movieNotifierProvider.notifier).defaultMovies();
      } else {
        ref.read(movieNotifierProvider.notifier).searchMovies(_searchController.text);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search Movies',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    _searchController.clear();
                    _onSearchChanged();
                  },
                ),
              ),
              onChanged: (text) => _onSearchChanged(),
            ),
          ],
        ),
      ),
    );
  }
}
