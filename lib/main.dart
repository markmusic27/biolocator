import 'package:biolocator/screens/dashboard_screen.dart';
import 'package:biolocator/screens/map_screen.dart';
import 'package:biolocator/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(BiolocatorApp());
}

class BiolocatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        DashboardScreen.id: (context) => DashboardScreen(),
        MapScreen.id: (context) => MapScreen(),
      },
      initialRoute: DashboardScreen.id,
    );
  }
}
