import 'package:flutter/material.dart';
import '../widgets/app.sidebar.dart';
import 'films_screen.dart';
import 'person_screen.dart';
import 'locations_screen.dart';
import 'species_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  final List<Widget> screens = [
    FilmsScreen(),
    PeopleScreen(),
    LocationsScreen(),
    SpeciesScreen(),
  ];

  void onItemSelected(int index) {
    setState(() {
      selectedIndex = index;
    });
    Navigator.pop(context); // close the drawer
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppSidebar(onItemSelected: onItemSelected),
      appBar: AppBar(
        title: const Text("Ghibli Explorer"),
      ),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: screens[selectedIndex],
      ),
    );
  }
}