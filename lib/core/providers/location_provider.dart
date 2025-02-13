import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';

@injectable
class LocationProvider extends ChangeNotifier {
  static final LocationProvider _instance = LocationProvider._internal();
  factory LocationProvider() => _instance;

  LocationProvider._internal();

  Stream<Position>? _positionStream;
  bool _grantedLocationPermission = false;

  Stream<Position>? get positionStream => _positionStream;
  bool get grantedLocationPermission => _grantedLocationPermission;

  Future<void> requestLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      _grantedLocationPermission = false;
      return;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        _grantedLocationPermission = false;
        return;
      }
    }
    _grantedLocationPermission = true;
  }

  Future<void> startLocationStream() async {
    _positionStream = Geolocator.getPositionStream(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 10,
      ),
    );
    notifyListeners();
  }
}
