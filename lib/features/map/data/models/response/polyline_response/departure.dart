import 'place.dart';

class Departure {
  String? time;
  Place? place;

  Departure({this.time, this.place});

  factory Departure.fromJson(Map<String, dynamic> json) => Departure(
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
