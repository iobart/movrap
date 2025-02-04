import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/injection/injection_di.dart';
import 'core/routes/fluro_router.dart';
import 'features/movie/presentation/screens/home_page.dart';

Future<void> main() async {
  await dotenv.load(fileName: '.env');
  AppRouter.setupRouter();
  await injectionSetup();
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MovRap',
      onGenerateRoute: AppRouter.router.generator,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
