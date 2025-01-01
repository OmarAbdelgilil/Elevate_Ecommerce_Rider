class Logout {
  String? message;

  Logout({this.message});

  factory Logout.fromJson(Map<String, dynamic> json) => Logout(
        message: json['message'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'message': message,
      };
}
