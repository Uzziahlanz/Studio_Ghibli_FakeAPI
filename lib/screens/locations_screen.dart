import 'package:flutter/material.dart';
import '../services/ghibli_service.dart';
import '../models/location.dart';
import '../widgets/ghibli_background.dart';
import '../widgets/location_modal.dart';

class LocationsScreen extends StatelessWidget {
  final _service = GhibliService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Studio ghibli Locations"),
        centerTitle: true,
        backgroundColor: const Color(0xFF00BFFF),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: GhibliBackground(
        child: FutureBuilder<List<GhibliLocation>>(
          future: _service.fetchLocations(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }

            return ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 10),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final loc = snapshot.data![index];

                return GestureDetector(
                  onTap: () => showLocationModal(context, loc),
                  child: Card(
                    color: Colors.white.withOpacity(0.95),
                    margin: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: ListTile(
                      title: Text(
                        loc.name,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle:
                          Text("${loc.climate} • ${loc.terrain}"),
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