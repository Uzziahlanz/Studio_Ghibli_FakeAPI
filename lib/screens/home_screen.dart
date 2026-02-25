import 'package:flutter/material.dart';
import 'films_screen.dart';
import 'people_screen.dart';
import 'locations_screen.dart';
import 'species_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _index = 0;

  final screens = [
    FilmsScreen(),
    PeopleScreen(),
    LocationsScreen(),
    SpeciesScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        onTap: (i) => setState(() => _index = i),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.movie), label: "Films"),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: "People"),
          BottomNavigationBarItem(icon: Icon(Icons.map), label: "Locations"),
          BottomNavigationBarItem(icon: Icon(Icons.pets), label: "Species"),
        ],
      ),
    );
  }
}
