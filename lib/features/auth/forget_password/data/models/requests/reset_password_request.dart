class ResetPasswordRequest {
  ResetPasswordRequest({this.email, this.newPassword});

  String? email;
  String? newPassword;
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = email;
    map['newPassword'] = newPassword;
    return map;
  }
}
