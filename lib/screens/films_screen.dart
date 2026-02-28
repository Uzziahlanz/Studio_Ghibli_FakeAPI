import 'package:flutter/material.dart';
import '../services/ghibli_service.dart';
import '../models/film.dart';
import 'film_detail_screen.dart';

class FilmsScreen extends StatelessWidget {
  final _service = GhibliService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Studio Ghibli Films")),
      body: FutureBuilder<List<Film>>(
        future: _service.fetchFilms(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData) return Center(child: Text("No data"));

          final films = snapshot.data!;
          return ListView.builder(
            itemCount: films.length,
            itemBuilder: (context, index) {
              final film = films[index];
              return Card(
                margin: EdgeInsets.all(12),
                child: ListTile(
                  title: Text(film.title),
                  subtitle: Text("Release Date: ${film.releaseDate}"),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => FilmDetailScreen(film: film),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
