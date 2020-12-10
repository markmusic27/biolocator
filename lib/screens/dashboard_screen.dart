import 'package:biolocator/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DashboardScreen extends StatelessWidget {
  static String id = "dashboard_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.red,
              child: GestureDetector(
                onTap: () {},
                child: GoogleMap(
                  mapType: MapType.satellite,
                  initialCameraPosition: CameraPosition(
                    target: LatLng(37.42796133580664, -122.085749655962),
                    zoom: 14.4746,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 30),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, WelcomeScreen.id);
                      },
                      child: Container(
                        height: 80,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.7),
                              offset: Offset(0, 0),
                              blurRadius: 6,
                            )
                          ],
                          borderRadius: BorderRadius.circular(20),
                          color: Color(
                            0xff00133E,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "Back",
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                              fontSize: 23,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
