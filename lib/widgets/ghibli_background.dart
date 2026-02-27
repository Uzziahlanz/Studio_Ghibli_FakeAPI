import 'package:flutter/material.dart';

class GhibliBackground extends StatelessWidget {
  final Widget child;

  const GhibliBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/ghibli_background.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        color: Colors.white.withOpacity(0.85),
        child: child,
      ),
    );
  }
}