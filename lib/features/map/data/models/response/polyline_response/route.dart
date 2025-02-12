import 'section.dart';

class Route {
  String? id;
  List<Section>? sections;

  Route({this.id, this.sections});

  factory Route.fromJson(Map<String, dynamic> json) => Route(
        id: json['id'] as String?,
        sections: (json['sections'] as List<dynamic>?)
            ?.map((e) => Section.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'sections': sections?.map((e) => e.toJson()).toList(),
      };
}
