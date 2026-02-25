import 'package:flutter/material.dart';
import '../services/ghibli_service.dart';
import '../models/person.dart';

class PeopleScreen extends StatelessWidget {
  final _service = GhibliService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Characters")),
      body: FutureBuilder<List<Person>>(
        future: _service.fetchPeople(),
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Center(child: CircularProgressIndicator());

          return ListView(
            children: snapshot.data!
                .map(
                  (p) => Card(
                    child: ListTile(
                      title: Text(p.name),
                      subtitle: Text("Age: ${p.age}  |  Gender: ${p.gender}"),
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
