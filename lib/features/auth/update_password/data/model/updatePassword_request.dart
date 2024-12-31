class UpdatePasswordRequest {
  UpdatePasswordRequest({
    this.password,
    this.newPassword,
  });

  String? password;
  String? newPassword;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['password'] = password;
    map['newPassword'] = newPassword;

    return map;
  }
}
