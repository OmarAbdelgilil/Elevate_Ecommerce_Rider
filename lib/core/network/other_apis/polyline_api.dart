import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

Future<Map<String, dynamic>> fetchRoute(
    String origin, String destination) async {
  final dio = Dio();
  if (!kReleaseMode) {
    // its debug mode so print app logs
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
      ),
    );
  }
  final response = await dio.get(
    "https://router.hereapi.com/v8/routes",
    queryParameters: {
      "transportMode": "car",
      "origin": origin,
      "destination": destination,
      "return": "polyline",
      "apiKey": dotenv.get("ROUTE_API_KEY"),
    },
  );

  return response.data;
}
