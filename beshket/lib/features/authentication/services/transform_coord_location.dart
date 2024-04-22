import 'package:geocoding/geocoding.dart';
import 'package:location/location.dart';

Future<String?> _getCityName(LocationData locationData) async {
  List<Placemark> placemarks = await placemarkFromCoordinates(
    locationData.latitude!,
    locationData.longitude!,
  );
  if (placemarks.isNotEmpty) {
    final place = placemarks[1];
    return place.locality;
  }
  return null;
}
