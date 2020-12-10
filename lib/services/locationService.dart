import 'package:location/location.dart';

class LocationService {
  Location location = Location();
  Future<LocationData> getUserLocation() async {
    await location.changeSettings(accuracy: LocationAccuracy.high);

    bool serviceEnabled = await location.serviceEnabled();
    PermissionStatus permissionStatus;
    LocationData _locationData;

    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
    }

    permissionStatus = await location.requestPermission();

    if (permissionStatus == PermissionStatus.denied) {
      permissionStatus = await location.requestPermission();
    }

    _locationData = await location.getLocation();

    return _locationData;
  }

  Future<void> requestLocationAccess() async {
    bool isEnabled = await location.serviceEnabled();

    if (!isEnabled) {
      await location.requestService();
    }
  }
}
