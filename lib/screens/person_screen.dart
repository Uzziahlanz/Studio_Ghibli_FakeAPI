import 'package:flutter/material.dart';
import '../services/ghibli_service.dart';
import '../models/person.dart';
import '../widgets/ghibli_background.dart';
import '../widgets/person_modal.dart';

class PeopleScreen extends StatelessWidget {
  final _service = GhibliService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Studio Ghibli Characters"),
        centerTitle: true,
        backgroundColor: const Color(0xFF00BFFF),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: GhibliBackground(
        child: FutureBuilder<List<Person>>(
          future: _service.fetchPeople(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }

            return ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 10),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final p = snapshot.data![index];

                return GestureDetector(
                  onTap: () => showPersonModal(context, p),
                  child: Card(
                    color: Colors.white.withOpacity(0.95),
                    margin: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: ListTile(
                      title: Text(
                        p.name,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle:
                          Text("Age: ${p.age} • Gender: ${p.gender}"),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}