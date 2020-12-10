import 'package:biolocator/screens/welcome_screen.dart';
import 'package:biolocator/services/locationService.dart';
import 'package:biolocator/services/twilioService.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DashboardScreen extends StatefulWidget {
  static String id = "dashboard_screen";
  final double lat;
  final double long;
  final double altitude;

  DashboardScreen({this.lat, this.long, this.altitude});

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final twilioService = TwilioService();
  final locationService = LocationService();
  double lat;
  double long;
  double alt;

  @override
  void initState() {
    super.initState();

    lat = widget.lat;
    long = widget.long;
    alt = widget.altitude;

    twilioService.changeAuthToken = DotEnv().env["AUTHTOKEN"];
    twilioService.changeAccountSid = DotEnv().env["ACCOUNTSID"];
    twilioService.changeTwilioNumber = DotEnv().env["TWILIONUMBER"];
  }

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
                    target: LatLng(lat, long),
                    zoom: 17,
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
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(top: 30),
                      child: Text(
                        "Latitude: $lat\n\nLongitude: $long",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 28,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: LargeButton(
                      color: Colors.blue,
                      text: "Recalibrate",
                      onTap: () async {
                        var locationData =
                            await locationService.getUserLocation();
                        setState(() {
                          lat = locationData.latitude;
                          long = locationData.longitude;
                          alt = locationData.altitude;
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 30),
                    child: LargeButton(
                      text: "Back",
                      onTap: () {
                        Navigator.pushNamed(context, WelcomeScreen.id);
                      },
                      color: Color(0xff00133E),
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

class LargeButton extends StatelessWidget {
  final String text;
  final Color color;
  final Function onTap;

  LargeButton({@required this.color, this.onTap, @required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 80,
        width: double.infinity,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.7),
            offset: Offset(0, 0),
            blurRadius: 6,
          )
        ], borderRadius: BorderRadius.circular(20), color: color),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.w900,
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
