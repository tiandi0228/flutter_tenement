import 'dart:convert';

UpgradeResponse upgradeModelFromJson(String str) =>
    UpgradeResponse.fromJson(json.decode(str));

String upgradeModelToJson(UpgradeResponse data) => json.encode(data.toJson());

class UpgradeResponse {
  int code;
  String message;
  UpgradeModel? data;

  UpgradeResponse({
    required this.code,
    required this.message,
    required this.data,
  });

  factory UpgradeResponse.fromJson(Map<String, dynamic> json) =>
      UpgradeResponse(
        code: json['code'],
        message: json['message'],
        data: json['data'] == null ? null : UpgradeModel.fromJson(json['data']),
      );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
    "data": data,
  };
}

class UpgradeModel {
  UpgradeModel({this.content, this.url});

  String? content;
  String? url;

  factory UpgradeModel.fromJson(Map<String, dynamic> json) =>
      UpgradeModel(content: json["content"] ?? '', url: json["url"] ?? '');

  Map<String, dynamic> toJson() => {"content": content, "url": url};
}
