import 'place.dart';

class Arrival {
  String? time;
  Place? place;

  Arrival({this.time, this.place});

  factory Arrival.fromJson(Map<String, dynamic> json) => Arrival(
        time: json['time'] as String?,
        place: json['place'] == null
            ? null
            : Place.fromJson(json['place'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'time': time,
        'place': place?.toJson(),
      };
}
