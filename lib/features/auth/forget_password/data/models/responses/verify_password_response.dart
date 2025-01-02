class VerifyPasswordResponse {
  VerifyPasswordResponse({
    this.status,
  });

  VerifyPasswordResponse.fromJson(dynamic json) {
    status = json['message'];
  }
  String? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    return map;
  }
}
