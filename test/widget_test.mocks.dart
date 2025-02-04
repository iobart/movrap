// Mocks generated by Mockito 5.4.5 from annotations
// in movrap/test/widget_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:mockito/mockito.dart' as _i1;
import 'package:movrap/features/movie/domain/models/movie.dart' as _i3;
import 'package:movrap/features/movie/presentation/provider/movie_provider.dart'
    as _i4;
import 'package:riverpod_annotation/riverpod_annotation.dart' as _i2;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: must_be_immutable
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeAutoDisposeAsyncNotifierProviderRef_0<T> extends _i1.SmartFake
    implements _i2.AutoDisposeAsyncNotifierProviderRef<T> {
  _FakeAutoDisposeAsyncNotifierProviderRef_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(parent, parentInvocation);
}

class _FakeAsyncValue_1<T> extends _i1.SmartFake implements _i2.AsyncValue<T> {
  _FakeAsyncValue_1(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

class _FakeMovie_2 extends _i1.SmartFake implements _i3.Movie {
  _FakeMovie_2(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

/// A class which mocks [MovieNotifier].
///
/// See the documentation for Mockito's code generation for more information.
class MockMovieNotifier extends _i1.Mock implements _i4.MovieNotifier {
  MockMovieNotifier() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.AutoDisposeAsyncNotifierProviderRef<List<_i3.Movie>> get ref =>
      (super.noSuchMethod(
            Invocation.getter(#ref),
            returnValue:
                _FakeAutoDisposeAsyncNotifierProviderRef_0<List<_i3.Movie>>(
                  this,
                  Invocation.getter(#ref),
                ),
          )
          as _i2.AutoDisposeAsyncNotifierProviderRef<List<_i3.Movie>>);

  @override
  _i2.AsyncValue<List<_i3.Movie>> get state =>
      (super.noSuchMethod(
            Invocation.getter(#state),
            returnValue: _FakeAsyncValue_1<List<_i3.Movie>>(
              this,
              Invocation.getter(#state),
            ),
          )
          as _i2.AsyncValue<List<_i3.Movie>>);

  @override
  set state(_i2.AsyncValue<List<_i3.Movie>>? newState) => super.noSuchMethod(
    Invocation.setter(#state, newState),
    returnValueForMissingStub: null,
  );

  @override
  _i5.Future<List<_i3.Movie>> get future =>
      (super.noSuchMethod(
            Invocation.getter(#future),
            returnValue: _i5.Future<List<_i3.Movie>>.value(<_i3.Movie>[]),
          )
          as _i5.Future<List<_i3.Movie>>);

  @override
  _i5.FutureOr<List<_i3.Movie>> build() =>
      (super.noSuchMethod(
            Invocation.method(#build, []),
            returnValue: _i5.Future<List<_i3.Movie>>.value(<_i3.Movie>[]),
          )
          as _i5.FutureOr<List<_i3.Movie>>);

  @override
  _i5.Future<void> defaultMovies() =>
      (super.noSuchMethod(
            Invocation.method(#defaultMovies, []),
            returnValue: _i5.Future<void>.value(),
            returnValueForMissingStub: _i5.Future<void>.value(),
          )
          as _i5.Future<void>);

  @override
  _i5.Future<void> loadNextPage({bool? isTopRated = false}) =>
      (super.noSuchMethod(
            Invocation.method(#loadNextPage, [], {#isTopRated: isTopRated}),
            returnValue: _i5.Future<void>.value(),
            returnValueForMissingStub: _i5.Future<void>.value(),
          )
          as _i5.Future<void>);

  @override
  _i5.Future<void> searchMovies(String? query) =>
      (super.noSuchMethod(
            Invocation.method(#searchMovies, [query]),
            returnValue: _i5.Future<void>.value(),
            returnValueForMissingStub: _i5.Future<void>.value(),
          )
          as _i5.Future<void>);

  @override
  _i5.Future<_i3.Movie> getMovieDetails(int? movieId) =>
      (super.noSuchMethod(
            Invocation.method(#getMovieDetails, [movieId]),
            returnValue: _i5.Future<_i3.Movie>.value(
              _FakeMovie_2(
                this,
                Invocation.method(#getMovieDetails, [movieId]),
              ),
            ),
          )
          as _i5.Future<_i3.Movie>);

  @override
  void listenSelf(
    void Function(
      _i2.AsyncValue<List<_i3.Movie>>?,
      _i2.AsyncValue<List<_i3.Movie>>,
    )?
    listener, {
    void Function(Object, StackTrace)? onError,
  }) => super.noSuchMethod(
    Invocation.method(#listenSelf, [listener], {#onError: onError}),
    returnValueForMissingStub: null,
  );

  @override
  _i5.Future<List<_i3.Movie>> update(
    _i5.FutureOr<List<_i3.Movie>> Function(List<_i3.Movie>)? cb, {
    _i5.FutureOr<List<_i3.Movie>> Function(Object, StackTrace)? onError,
  }) =>
      (super.noSuchMethod(
            Invocation.method(#update, [cb], {#onError: onError}),
            returnValue: _i5.Future<List<_i3.Movie>>.value(<_i3.Movie>[]),
          )
          as _i5.Future<List<_i3.Movie>>);

  @override
  bool updateShouldNotify(
    _i2.AsyncValue<List<_i3.Movie>>? previous,
    _i2.AsyncValue<List<_i3.Movie>>? next,
  ) =>
      (super.noSuchMethod(
            Invocation.method(#updateShouldNotify, [previous, next]),
            returnValue: false,
          )
          as bool);
}
