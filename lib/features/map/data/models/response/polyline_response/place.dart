import 'location.dart';
import 'original_location.dart';

class Place {
  String? type;
  Location? location;
  OriginalLocation? originalLocation;

  Place({this.type, this.location, this.originalLocation});

  factory Place.fromJson(Map<String, dynamic> json) => Place(
        type: json['type'] as String?,
        location: json['location'] == null
            ? null
            : Location.fromJson(json['location'] as Map<String, dynamic>),
        originalLocation: json['originalLocation'] == null
            ? null
            : OriginalLocation.fromJson(
                json['originalLocation'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'type': type,
        'location': location?.toJson(),
        'originalLocation': originalLocation?.toJson(),
      };
}
