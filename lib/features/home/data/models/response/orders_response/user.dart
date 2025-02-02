class User {
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? gender;
  String? phone;
  String? photo;
  String? passwordResetCode;
  DateTime? passwordResetExpires;
  bool? resetCodeVerified;
  DateTime? passwordChangedAt;

  User({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.gender,
    this.phone,
    this.photo,
    this.passwordResetCode,
    this.passwordResetExpires,
    this.resetCodeVerified,
    this.passwordChangedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['_id'] as String?,
        firstName: json['firstName'] as String?,
        lastName: json['lastName'] as String?,
        email: json['email'] as String?,
        gender: json['gender'] as String?,
        phone: json['phone'] as String?,
        photo: json['photo'] as String?,
        passwordResetCode: json['passwordResetCode'] as String?,
        passwordResetExpires: json['passwordResetExpires'] == null
            ? null
            : DateTime.parse(json['passwordResetExpires'] as String),
        resetCodeVerified: json['resetCodeVerified'] as bool?,
        passwordChangedAt: json['passwordChangedAt'] == null
            ? null
            : DateTime.parse(json['passwordChangedAt'] as String),
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'gender': gender,
        'phone': phone,
        'photo': photo,
        'passwordResetCode': passwordResetCode,
        'passwordResetExpires': passwordResetExpires?.toIso8601String(),
        'resetCodeVerified': resetCodeVerified,
        'passwordChangedAt': passwordChangedAt?.toIso8601String(),
      };
}
