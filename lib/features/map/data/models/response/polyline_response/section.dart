import 'arrival.dart';
import 'departure.dart';
import 'transport.dart';

class Section {
  String? id;
  String? type;
  Departure? departure;
  Arrival? arrival;
  String? polyline;
  Transport? transport;

  Section({
    this.id,
    this.type,
    this.departure,
    this.arrival,
    this.polyline,
    this.transport,
  });

  factory Section.fromJson(Map<String, dynamic> json) => Section(
        id: json['id'] as String?,
        type: json['type'] as String?,
        departure: json['departure'] == null
            ? null
            : Departure.fromJson(json['departure'] as Map<String, dynamic>),
        arrival: json['arrival'] == null
            ? null
            : Arrival.fromJson(json['arrival'] as Map<String, dynamic>),
        polyline: json['polyline'] as String?,
        transport: json['transport'] == null
            ? null
            : Transport.fromJson(json['transport'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'type': type,
        'departure': departure?.toJson(),
        'arrival': arrival?.toJson(),
        'polyline': polyline,
        'transport': transport?.toJson(),
      };
}
