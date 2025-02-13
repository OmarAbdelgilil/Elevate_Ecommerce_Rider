import 'route.dart';

class PolylineResponse {
  List<Route>? routes;

  PolylineResponse({this.routes});

  factory PolylineResponse.fromJson(Map<String, dynamic> json) {
    return PolylineResponse(
      routes: (json['routes'] as List<dynamic>?)
          ?.map((e) => Route.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'routes': routes?.map((e) => e.toJson()).toList(),
      };
}
