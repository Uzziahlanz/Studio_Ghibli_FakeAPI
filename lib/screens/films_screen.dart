import 'package:flutter/material.dart';
import '../services/ghibli_service.dart';
import '../models/film.dart';
import '../widgets/film_modal.dart';
import '../widgets/ghibli_background.dart';

class FilmsScreen extends StatelessWidget {
  final GhibliService _service = GhibliService();

  FilmsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Studio Ghibli Films"),
        centerTitle: true,
        backgroundColor: const Color(0xFF00BFFF),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: GhibliBackground(
        child: FutureBuilder<List<Film>>(
          future: _service.fetchFilms(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text("No films found"));
            }

            final films = snapshot.data!;

            return ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 10),
              itemCount: films.length,
              itemBuilder: (context, index) {
                final film = films[index];

                final card = GestureDetector(
                  onTap: () => showFilmModal(context, film),
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.95),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 8,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                          child: Image.network(
                            film.movieBanner.isNotEmpty
                                ? film.movieBanner
                                : film.image,
                            height: 180,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(14),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                film.title,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                "Director: ${film.director} • ${film.releaseDate}",
                                style: const TextStyle(fontSize: 13),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                film.description,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );

                return TweenAnimationBuilder(
                  duration: Duration(milliseconds: 400 + index * 100),
                  tween: Tween(begin: 0.0, end: 1.0),
                  builder: (context, value, child) {
                    return Transform.translate(
                      offset: Offset(0, 50 * (1 - value)),
                      child: Opacity(opacity: value, child: child),
                    );
                  },
                  child: card,
                );
              },
            );
          },
        ),
      ),
    );
  }
}