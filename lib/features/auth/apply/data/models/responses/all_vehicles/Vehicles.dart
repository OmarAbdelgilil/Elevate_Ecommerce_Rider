
class Vehicles {
  Vehicles({
      this.id, 
      this.type, 
      this.image, 
      this.createdAt, 
      this.updatedAt, 
      this.v,});

  Vehicles.fromJson(dynamic json) {
    id = json['_id'];
    type = json['type'];
    image = json['image'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
  }
  String? id;
  String? type;
  String? image;
  String? createdAt;
  String? updatedAt;
  int? v;
Vehicles copyWith({  String? id,
  String? type,
  String? image,
  String? createdAt,
  String? updatedAt,
  int? v,
}) => Vehicles(  id: id ?? this.id,
  type: type ?? this.type,
  image: image ?? this.image,
  createdAt: createdAt ?? this.createdAt,
  updatedAt: updatedAt ?? this.updatedAt,
  v: v ?? this.v,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['type'] = type;
    map['image'] = image;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    return map;
  }

}