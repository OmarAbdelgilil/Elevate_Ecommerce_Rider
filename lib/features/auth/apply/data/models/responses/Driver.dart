/// country : "Egypt"
/// firstName : "Ahmed"
/// lastName : "Ali"
/// vehicleType : "676b31a45d05310ca82657ac"
/// vehicleNumber : "12224"
/// vehicleLicense : "d8d33612-7019-4a0a-8d54-e50e312b05bb-كأس افضل حد يكتب css.jpg"
/// NID : "12345678912343"
/// NIDImg : "7c9c0f9f-76ab-4c7c-a922-b8cb6bbc9d89-كأس افضل حد يكتب css.jpg"
/// email : "daly13abdall@gmail.com"
/// gender : "male"
/// phone : "+201010700880"
/// photo : "default-profile.png"
/// _id : "677549ca9f3884b3405c48b6"
/// createdAt : "2025-01-01T13:57:30.058Z"

class Driver {
  Driver({
      this.country, 
      this.firstName, 
      this.lastName, 
      this.vehicleType, 
      this.vehicleNumber, 
      this.vehicleLicense, 
      this.nid, 
      this.nIDImg, 
      this.email, 
      this.gender, 
      this.phone, 
      this.photo, 
      this.id, 
      this.createdAt,});

  Driver.fromJson(dynamic json) {
    country = json['country'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    vehicleType = json['vehicleType'];
    vehicleNumber = json['vehicleNumber'];
    vehicleLicense = json['vehicleLicense'];
    nid = json['NID'];
    nIDImg = json['NIDImg'];
    email = json['email'];
    gender = json['gender'];
    phone = json['phone'];
    photo = json['photo'];
    id = json['_id'];
    createdAt = json['createdAt'];
  }
  String? country;
  String? firstName;
  String? lastName;
  String? vehicleType;
  String? vehicleNumber;
  String? vehicleLicense;
  String? nid;
  String? nIDImg;
  String? email;
  String? gender;
  String? phone;
  String? photo;
  String? id;
  String? createdAt;
Driver copyWith({  String? country,
  String? firstName,
  String? lastName,
  String? vehicleType,
  String? vehicleNumber,
  String? vehicleLicense,
  String? nid,
  String? nIDImg,
  String? email,
  String? gender,
  String? phone,
  String? photo,
  String? id,
  String? createdAt,
}) => Driver(  country: country ?? this.country,
  firstName: firstName ?? this.firstName,
  lastName: lastName ?? this.lastName,
  vehicleType: vehicleType ?? this.vehicleType,
  vehicleNumber: vehicleNumber ?? this.vehicleNumber,
  vehicleLicense: vehicleLicense ?? this.vehicleLicense,
  nid: nid ?? this.nid,
  nIDImg: nIDImg ?? this.nIDImg,
  email: email ?? this.email,
  gender: gender ?? this.gender,
  phone: phone ?? this.phone,
  photo: photo ?? this.photo,
  id: id ?? this.id,
  createdAt: createdAt ?? this.createdAt,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['country'] = country;
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['vehicleType'] = vehicleType;
    map['vehicleNumber'] = vehicleNumber;
    map['vehicleLicense'] = vehicleLicense;
    map['NID'] = nid;
    map['NIDImg'] = nIDImg;
    map['email'] = email;
    map['gender'] = gender;
    map['phone'] = phone;
    map['photo'] = photo;
    map['_id'] = id;
    map['createdAt'] = createdAt;
    return map;
  }

}