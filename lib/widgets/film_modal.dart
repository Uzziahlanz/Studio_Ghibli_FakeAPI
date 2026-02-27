import 'package:flutter/material.dart';
import '../models/film.dart';

void showFilmModal(BuildContext context, Film film) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (_) {
      return DraggableScrollableSheet(
        initialChildSize: 0.7,
        maxChildSize: 0.95,
        minChildSize: 0.5,
        builder: (_, controller) {
          return Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Color(0xFFFFF5F1),
              borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
            ),
            child: ListView(
              controller: controller,
              children: [
                Text(
                  film.title,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                Image.network(film.movieBanner),

                const SizedBox(height: 10),

                Text("Director: ${film.director}"),
                Text("Producer: ${film.producer}"),
                Text("Release: ${film.releaseDate}"),

                const SizedBox(height: 15),

                Text(film.description),
              ],
            ),
          );
        },
      );
    },
  );
}