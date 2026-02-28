import 'package:flutter/material.dart';
import '../models/film.dart';

class FilmDetailScreen extends StatelessWidget {
  final Film film;

  FilmDetailScreen({required this.film});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(film.title)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(film.title, style: Theme.of(context).textTheme.titleLarge),
            SizedBox(height: 10),
            Text("Original Title: ${film.originalTitle}"),
            Text("Original Title Romanised: ${film.originalTitleRomanised}"),
            Text("Director: ${film.director}"),
            Text("Release: ${film.releaseDate}"),
            Text("Running time: ${film.running_time}"),
            Text("RT score: ${film.rt_score}"),
            SizedBox(height: 20),
            Text(film.description),
          ],
        ),
      ),
    );
  }
}
