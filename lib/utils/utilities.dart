import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

LatLngBounds getBoundsFromCoordinates(List<LatLng> coordinates) {
  double minLat = double.infinity;
  double maxLat = -double.infinity;
  double minLng = double.infinity;
  double maxLng = -double.infinity;

  for (LatLng coordinate in coordinates) {
    if (coordinate.latitude < minLat) minLat = coordinate.latitude;
    if (coordinate.latitude > maxLat) maxLat = coordinate.latitude;
    if (coordinate.longitude < minLng) minLng = coordinate.longitude;
    if (coordinate.longitude > maxLng) maxLng = coordinate.longitude;
  }

  return LatLngBounds(
    LatLng(minLat, minLng),
    LatLng(maxLat, maxLng),
  );
}
