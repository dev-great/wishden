import 'dart:math' show cos, sqrt, asin;

double calculateDistance(lat1, lon1, lat2, lon2) {
  if (lat2 != null && lat1 != null) {
    const p = 0.017453292519943295;
    final a = 0.5 -
        cos((lat2 - lat1) * p) / 2 +
        cos(lat1 * p) * cos(lat2 * p) * (1 - cos((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }
  return 0;
}
