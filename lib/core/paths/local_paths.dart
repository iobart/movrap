import 'package:flutter_dotenv/flutter_dotenv.dart';

class LocalAppPaths {
  static String endPointMovieDb = dotenv.env['TMDB_API_KEY']!;
}