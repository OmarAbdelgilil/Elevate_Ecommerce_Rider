class VerifyPasswordRequest {
  VerifyPasswordRequest({
    this.resetCode,
  });

  String? resetCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['resetCode'] = resetCode;
    return map;
  }
}
