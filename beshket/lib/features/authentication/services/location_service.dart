//<Martin Podmanicky>
import 'package:location/location.dart';

class LocationService {
  Future<bool> requestLocationPremission() async {
    Location location = new Location();
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return false;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return false;
      }
    }
    return true;
  }

  Future<LocationData?> getLocation() async {
    Location location = new Location();
    bool hasPermission = await requestLocationPremission();
    if (!hasPermission) {
      return null;
    }
    LocationData _locationData = await location.getLocation();
    return _locationData;
  }
}
