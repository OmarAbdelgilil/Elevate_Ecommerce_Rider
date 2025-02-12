class OriginalLocation {
  double? lat;
  double? lng;

  OriginalLocation({this.lat, this.lng});

  factory OriginalLocation.fromJson(Map<String, dynamic> json) {
    return OriginalLocation(
      lat: (json['lat'] as num?)?.toDouble(),
      lng: (json['lng'] as num?)?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() => {
        'lat': lat,
        'lng': lng,
      };
}
