import 'dart:convert';

PasswordResponse passwordModelFromJson(String str) =>
    PasswordResponse.fromJson(json.decode(str));

String passwordModelToJson(PasswordResponse data) => json.encode(data.toJson());

class PasswordResponse {
  int code;
  String message;
  String data;

  PasswordResponse({
    required this.code,
    required this.message,
    required this.data,
  });

  factory PasswordResponse.fromJson(Map<String, dynamic> json) =>
      PasswordResponse(
        code: json['code'],
        message: json['message'],
        data: json['data'] ?? "",
      );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
    "data": data,
  };
}
