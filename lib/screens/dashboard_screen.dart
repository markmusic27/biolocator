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
              child: GoogleMap(
                mapType: MapType.satellite,
                initialCameraPosition: CameraPosition(
                  target: LatLng(37.42796133580664, -122.085749655962),
                  zoom: 14.4746,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(),
          )
        ],
      ),
    );
  }
}
