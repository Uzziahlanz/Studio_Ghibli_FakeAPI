import 'package:flutter/material.dart';
import '../services/ghibli_service.dart';
import '../models/species.dart';

class SpeciesScreen extends StatelessWidget {
  final _service = GhibliService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Species")),
      body: FutureBuilder<List<Species>>(
        future: _service.fetchSpecies(),
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Center(child: CircularProgressIndicator());

          return ListView(
            children: snapshot.data!
                .map(
                  (s) => Card(
                    child: ListTile(
                      title: Text(s.name),
                      subtitle: Text("Type: ${s.classification}"),
                    ),
                  ),
                )
                .toList(),
          );
        },
      ),
    );
  }
}
