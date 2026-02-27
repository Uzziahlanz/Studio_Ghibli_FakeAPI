import 'package:flutter/material.dart';

class AppSidebar extends StatelessWidget {
  final Function(int) onItemSelected;

  const AppSidebar({super.key, required this.onItemSelected});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: const Color(0xFF00BFFF),
        child: Column(
          children: [
            const SizedBox(height: 40),

            // 🖼 LOGO
            CircleAvatar(
              radius: 35,
              backgroundImage:
                  AssetImage('assets/images/studioghibli.jpg'),
            ),

            const SizedBox(height: 10),

            const Text(
              "Ghibli Explorer",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            _buildItem(Icons.movie, "Films", 0),
            _buildItem(Icons.people, "People", 1),
            _buildItem(Icons.public, "Locations", 2),
            _buildItem(Icons.pets, "Species", 3),
          ],
        ),
      ),
    );
  }

  Widget _buildItem(IconData icon, String title, int index) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(title, style: const TextStyle(color: Colors.white)),
      onTap: () => onItemSelected(index),
    );
  }
}