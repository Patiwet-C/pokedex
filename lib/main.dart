import 'package:flutter/material.dart';
import 'package:pokedex/pokedex/landing/landing_screen.dart';

void main() {
  runApp(PokedexApp());
}

class PokedexApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LandingScreen(),
    );
  }
}
