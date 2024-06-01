import 'package:flutter/material.dart';
import 'package:movie_app/features/movies/presentation/pages/movie_page.dart';
import 'package:movie_app/injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const MoviePage(),
    );
  }
}
