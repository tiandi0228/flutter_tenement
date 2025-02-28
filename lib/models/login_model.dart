import 'dart:convert';

LoginResponse loginModelFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

String loginModelToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  int code;
  String message;
  LoginModel? data;

  LoginResponse({required this.code, required this.message, required this.data});

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
    code: json['code'],
    message: json['message'],
    data: json['data'] == null ? null : LoginModel.fromJson(json['data']),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
    "data": data,
  };
}

class LoginModel {
  LoginModel({
    required this.accessToken,
    required this.phone,
    required this.id,
  });

  String accessToken;
  String phone;
  int id;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    accessToken: json["access_token"] ?? '',
    phone: json["phone"] ?? '',
    id: json["id"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "access_token": accessToken,
    "phone": phone,
    "id": id,
  };
}
