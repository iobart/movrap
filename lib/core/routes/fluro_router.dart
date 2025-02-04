import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:movrap/features/movie/presentation/screens/detail_screen.dart';

class AppRouter {
  static final FluroRouter _router = FluroRouter();

  static FluroRouter get router => _router;

  static final Handler _movieDetailHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
      final int movieId = int.parse(params['id'][0]);
      return MovieDetailScreen(movieId: movieId);
    },
  );

  static void setupRouter() {
    _router.define(
      '/movie/:id',
      handler: _movieDetailHandler,
      transitionType: TransitionType.inFromRight,
    );
  }
}