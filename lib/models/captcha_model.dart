import 'dart:convert';

CaptchaResponse captchaModelFromJson(String str) =>
    CaptchaResponse.fromJson(json.decode(str));

String captchaModelToJson(CaptchaResponse data) => json.encode(data.toJson());

class CaptchaResponse {
  int? code;
  String? message;
  String? data;

  CaptchaResponse({this.code, this.message, this.data});

  factory CaptchaResponse.fromJson(Map<String, dynamic> json) =>
      CaptchaResponse(
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