import 'Metadata.dart';
import 'Vehicles.dart';

class VehicleResponse {
  VehicleResponse({
      this.message, 
      this.metadata, 
      this.vehicles,});

  VehicleResponse.fromJson(dynamic json) {
    message = json['message'];
    metadata = json['metadata'] != null ? Metadata.fromJson(json['metadata']) : null;
    if (json['vehicles'] != null) {
      vehicles = [];
      json['vehicles'].forEach((v) {
        vehicles?.add(Vehicles.fromJson(v));
      });
    }
  }
  String? message;
  Metadata? metadata;
  List<Vehicles>? vehicles;
VehicleResponse copyWith({  String? message,
  Metadata? metadata,
  List<Vehicles>? vehicles,
}) => VehicleResponse(  message: message ?? this.message,
  metadata: metadata ?? this.metadata,
  vehicles: vehicles ?? this.vehicles,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (metadata != null) {
      map['metadata'] = metadata?.toJson();
    }
    if (vehicles != null) {
      map['vehicles'] = vehicles?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}