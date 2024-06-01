import 'package:flutter/material.dart';

class MoviePage extends StatelessWidget {
  const MoviePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie Page'),
      ),
      body: const Center(
        child: Text('Movie Page'),
      ),
    );
  }
}
