import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import 'package:flutter/cupertino.dart';

class GetLatlong extends ChangeNotifier {
  
  Position? _Currentlatelong;
  Position? get latelong => _Currentlatelong;

  Convertlatlong location = Convertlatlong();
  Placemark? _finallocation;
  Placemark? get lastLoaction => _finallocation;

  Future<void> getLatelong() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      _Currentlatelong = null;
      notifyListeners();
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        _Currentlatelong = null;
        notifyListeners();
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      _Currentlatelong = null;
      notifyListeners();
      return;
    }

    _Currentlatelong = await Geolocator.getCurrentPosition();
    print(_Currentlatelong);

    _finallocation = await location.covertLocation(_Currentlatelong);
    print(_finallocation);
    notifyListeners();
  }
}

class Convertlatlong {
  Position? latlong;

  Future<Placemark?> covertLocation(Position? latlong) async {
    if (latlong != null) {
      try {
        final result =
            await placemarkFromCoordinates(latlong.latitude, latlong.longitude);
        if (result.isNotEmpty) {
          return result[0];
        }
      } catch (e) {
        print("feathing error");
      }

      return null;
    }
    return null;
  }
}
