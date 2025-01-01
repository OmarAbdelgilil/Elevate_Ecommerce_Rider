class Country {
  final String isoCode;
  final String name;
  final String flag;

  Country({
    required this.isoCode,
    required this.name,
    required this.flag,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      isoCode: json['isoCode'],
      name: json['name'],
      flag: json['flag'],
    );
  }
}
