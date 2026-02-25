import 'package:flutter/material.dart';
import '../services/ghibli_service.dart';
import '../models/location.dart';

class LocationsScreen extends StatelessWidget {
  final _service = GhibliService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Locations")),
      body: FutureBuilder<List<GhibliLocation>>(
        future: _service.fetchLocations(),
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Center(child: CircularProgressIndicator());

          return ListView(
            children: snapshot.data!
                .map(
                  (loc) => Card(
                    child: ListTile(
                      title: Text(loc.name),
                      subtitle: Text("${loc.climate} • ${loc.terrain}"),
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
