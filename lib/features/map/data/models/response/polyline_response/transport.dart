class Transport {
  String? mode;

  Transport({this.mode});

  factory Transport.fromJson(Map<String, dynamic> json) => Transport(
        mode: json['mode'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'mode': mode,
      };
}
