import 'package:flutter/material.dart';
  import 'package:flutter_riverpod/flutter_riverpod.dart';
  import 'package:movrap/features/movie/presentation/provider/movie_provider.dart';
  import 'package:movrap/features/movie/presentation/widgets/movie_list_item.dart';
  import 'package:movrap/features/movie/presentation/widgets/search_bar.dart';

  class HomePage extends ConsumerStatefulWidget {
    const HomePage({super.key});

    @override
    _HomePageState createState() => _HomePageState();
  }

  class _HomePageState extends ConsumerState<HomePage> {
    final ScrollController _scrollController = ScrollController();

    @override
    void initState() {
      super.initState();
      _scrollController.addListener(_onScroll);
    }

    @override
    void dispose() {
      _scrollController.removeListener(_onScroll);
      _scrollController.dispose();
      super.dispose();
    }

    void _onScroll() {
      if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent) {
        ref.read(movieNotifierProvider.notifier).loadNextPage(isTopRated: false);
      }
    }

    @override
    Widget build(BuildContext context) {
      final moviesAsync = ref.watch(movieNotifierProvider);
      return Scaffold(
        appBar: AppBar(
          title: const Text('MovRap', style: TextStyle(color: Colors.white)),
          centerTitle: false,
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
          actions: [
            IconButton(
              icon: const Icon(Icons.star, color: Colors.white),
              onPressed: () {
                ref.read(movieNotifierProvider.notifier).defaultMovies();
              },
            ),
            IconButton(
              icon: const Icon(Icons.trending_up, color: Colors.white),
              onPressed: () {
                ref.read(movieNotifierProvider.notifier).loadTopRatedMovies();
              },
            ),
          ],
        ),
        body: Column(
          children: [
            const MovieSearchWidget(),
            Expanded(
              child: moviesAsync.when(
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (error, stack) => Center(child: Text('Error: $error')),
                data: (movies) {
                  return ListView.builder(
                    controller: _scrollController,
                    itemCount: movies.length,
                    itemBuilder: (context, index) {
                      final movie = movies[index];
                      return MovieListItem(movie: movie);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      );
    }
  }