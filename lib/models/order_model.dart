import 'dart:convert';

OrderResponse orderModelFromJson(String str) =>
    OrderResponse.fromJson(json.decode(str));

String orderModelToJson(OrderResponse data) =>
    json.encode(data.toJson());

class OrderResponse {
  int code;
  String message;
  List<OrderModel>? data;

  OrderResponse({
    required this.code,
    required this.message,
    required this.data,
  });

  factory OrderResponse.fromJson(Map<String, dynamic> json) =>
      OrderResponse(
        code: json['code'],
        message: json['message'],
        data:
            json['code'] == 100001
                ? List<OrderModel>.from(
                  json["data"].map((x) => OrderModel.fromJson(x)),
                )
                : [],
      );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class OrderModel {
  OrderModel({
    required this.year,
    required this.total,
    required this.waterUsed,
    required this.electricityConsumption,
  });

  String year;
  int total;
  num waterUsed;
  num electricityConsumption;

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      OrderModel(
        year: json["year"] ?? "",
        total: json["total"] ?? 0,
        waterUsed: json["water_used"] ?? 0,
        electricityConsumption: json["electricity_consumption"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
    "year": year,
    "total": total,
    "water_used": waterUsed,
    "electricity_consumption": electricityConsumption,
  };
}
