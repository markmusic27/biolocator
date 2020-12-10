import 'package:biolocator/screens/dashboard_screen.dart';
import 'package:biolocator/screens/map_screen.dart';
import 'package:biolocator/screens/welcome_screen.dart';
import 'package:biolocator/services/locationService.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  final locationService = LocationService();

  await DotEnv().load(".env");
  await locationService.requestLocationAccess();
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
      initialRoute: WelcomeScreen.id,
    );
  }
}
