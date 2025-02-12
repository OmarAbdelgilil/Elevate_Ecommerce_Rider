// ignore_for_file: prefer_const_declarations

import 'dart:async';
import 'dart:ui' as ui;

import 'package:elevate_ecommerce_driver/core/common/result.dart';
import 'package:elevate_ecommerce_driver/core/providers/location_provider.dart';
import 'package:elevate_ecommerce_driver/features/map/data/contracts/online_data_source.dart';
import 'package:elevate_ecommerce_driver/utils/color_manager.dart';
import 'package:flexible_polyline_dart/flutter_flexible_polyline.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:http/http.dart' as http;

@injectable
class MapScreenViewModel extends Cubit<MapScreenState> {
  String? mapStyle;
  BitmapDescriptor? destMarker;
  BitmapDescriptor? driverMarker;
  Set<Polyline> polylines = {};
  StreamSubscription<Position>? _positonListener;
  double driverLat = 0.0;
  double driverLong = 0.0;
  final OnlineDataSource _onlineDataSource;

  MapScreenViewModel(this._onlineDataSource) : super(MapInitialState());

  void doIntent(MapScreenIntent intent) {
    switch (intent) {
      case LoadMap():
        _loadMapData(intent.locationName, intent.locationImg,
            intent.locationLat, intent.locationLong);
        return;
    }
  }

  void dispose() {
    _positonListener?.cancel();
    _positonListener = null;
  }

  Future<List<LatLng>> _getPolyline(
      double locationLat, double locationLng) async {
    final encoded = await _onlineDataSource.getPolyline(
        driverLat, driverLong, locationLat, locationLng);

    if (encoded is Success<String> &&
        encoded.data != null &&
        encoded.data!.isNotEmpty) {
      try {
        final result = FlexiblePolyline.decode(encoded.data!);
        return result.map((point) => LatLng(point.lat, point.lng)).toList();
      } catch (e) {
        return [];
      }
    } else {
      return [];
    }
  }

  Future<BitmapDescriptor> _getCustomMarker(
      String label, String imageUrl) async {
    const double baseHeight = 80; // Smaller height
    const double circleSize = 60; // Smaller circular image
    const double tailWidth = 25; // Smaller speech bubble tail
    const double tailHeight = 20;
    const double padding = 8;

    // Create a text painter to measure the text width dynamically
    final textPainter = TextPainter(
      text: TextSpan(
        text: label,
        style: const TextStyle(
            color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();

    // Compute dynamic width (circle + text + padding)
    final double textWidth = textPainter.width + 2 * padding;
    final double width = circleSize + textWidth + padding;

    final ui.PictureRecorder recorder = ui.PictureRecorder();
    final Canvas canvas = Canvas(recorder);

    // Draw speech bubble background
    final Paint bgPaint = Paint()..color = Colors.pink;
    final RRect roundedRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, width, baseHeight),
      const Radius.circular(20),
    );
    canvas.drawRRect(roundedRect, bgPaint);

    // Draw speech bubble tail
    Path tailPath = Path();
    tailPath.moveTo(width / 2 - tailWidth / 2, baseHeight);
    tailPath.lineTo(width / 2 + tailWidth / 2, baseHeight);
    tailPath.lineTo(width / 2, baseHeight + tailHeight);
    tailPath.close();
    canvas.drawPath(tailPath, bgPaint);

    // Load image from URL or placeholder
    final Uint8List imgBytes = await _downloadImage(imageUrl);
    final ui.Codec codec = await ui.instantiateImageCodec(imgBytes,
        targetWidth: circleSize.toInt());
    final ui.FrameInfo frameInfo = await codec.getNextFrame();
    final ui.Image image = frameInfo.image;

    final double imageX = padding;
    final double imageY = (baseHeight - circleSize) / 2;

    // Save canvas before clipping
    canvas.save();
    final Path circlePath = Path()
      ..addOval(Rect.fromCircle(
          center: Offset(imageX + circleSize / 2, imageY + circleSize / 2),
          radius: circleSize / 2));
    canvas.clipPath(circlePath);
    paintImage(
        canvas: canvas,
        rect: Rect.fromLTWH(imageX, imageY, circleSize, circleSize),
        image: image);
    canvas.restore(); // Restore canvas after drawing image

    // Draw text beside the image
    final double textX = circleSize + 1.5 * padding;
    final double textY = (baseHeight - textPainter.height) / 2;

    textPainter.paint(canvas, Offset(textX, textY));

    // Convert canvas to image
    final img = await recorder
        .endRecording()
        .toImage(width.toInt(), (baseHeight + tailHeight).toInt());
    final byteData = await img.toByteData(format: ui.ImageByteFormat.png);
    final Uint8List finalImgBytes = byteData!.buffer.asUint8List();

    return BitmapDescriptor.fromBytes(finalImgBytes);
  }

  Future<Uint8List> _downloadImage(String url) async {
    try {
      // Validate URL before making the request
      if (!Uri.tryParse(url)!.hasAbsolutePath) {
        debugPrint('Invalid URL: $url, using placeholder...');
        return await _loadPlaceholderImage();
      }

      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return response.bodyBytes;
      } else {
        debugPrint('Image URL not found: $url, loading placeholder...');
      }
    } catch (e) {
      debugPrint('Error loading image: $e, using placeholder...');
    }

    return await _loadPlaceholderImage();
  }

  Future<void> _setDriverLocationPolyline(
      Position pos, double locationLat, double locationLng) async {
    driverLat = pos.latitude;
    driverLong = pos.longitude;
    final coordinates = await _getPolyline(locationLat, locationLng);
    polylines = {
      Polyline(
        polylineId: const PolylineId("route"),
        color: ColorManager.primary,
        width: 5,
        points: coordinates,
      )
    };
  }

  Future<void> _startLocationStream(
      double locationLat, double locationLng) async {
    final pos = await Geolocator.getCurrentPosition();
    await _setDriverLocationPolyline(pos, locationLat, locationLng);
    _positonListener =
        LocationProvider().positionStream!.listen((Position position) async {
      await _setDriverLocationPolyline(position, locationLat, locationLng);
      emit(DriverMovedState());
    });
  }

// Load placeholder image
  Future<Uint8List> _loadPlaceholderImage() async {
    final ByteData placeholderData =
        await rootBundle.load('assets/images/location_placeholder.png');
    return placeholderData.buffer.asUint8List();
  }

  Future<void> _loadMapData(String locationName, String locationImage,
      double locationLat, double locationLong) async {
    emit(MapLoadingState());
    destMarker = await _getCustomMarker(locationName, locationImage);
    driverMarker = await _getCustomMarker('Your location', '');
    await _startLocationStream(locationLat, locationLong);
    mapStyle = await rootBundle.loadString('assets/map_style/map_style.json');

    emit(MapLoadedState());
  }
}

sealed class MapScreenState {}

class MapInitialState extends MapScreenState {}

class MapLoadingState extends MapScreenState {}

class MapLoadedState extends MapScreenState {}

class DriverMovedState extends MapScreenState {}

sealed class MapScreenIntent {}

class LoadMap extends MapScreenIntent {
  final String locationName;
  final String locationImg;
  double locationLat;
  double locationLong;
  LoadMap(
      this.locationName, this.locationImg, this.locationLat, this.locationLong);
}
