import 'dart:convert';

OrderDetailResponse orderDetailModelFromJson(String str) =>
    OrderDetailResponse.fromJson(json.decode(str));

String orderDetailModelToJson(OrderDetailResponse data) =>
    json.encode(data.toJson());

class OrderDetailResponse {
  int code;
  String message;
  List<OrderDetailModel>? data;

  OrderDetailResponse({
    required this.code,
    required this.message,
    required this.data,
  });

  factory OrderDetailResponse.fromJson(Map<String, dynamic> json) =>
      OrderDetailResponse(
        code: json['code'],
        message: json['message'],
        data:
            json['code'] == 100001
                ? List<OrderDetailModel>.from(
                  json["data"].map((x) => OrderDetailModel.fromJson(x)),
                )
                : [],
      );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class OrderDetailModel {
  OrderDetailModel({
    required this.id,
    required this.waterBill,
    required this.electricity,
    required this.months,
    required this.total,
    required this.waterUsed,
    required this.electricityConsumption,
  });

  int id;
  num waterBill;
  num electricity;
  String months;
  num total;
  num waterUsed;
  num electricityConsumption;

  factory OrderDetailModel.fromJson(Map<String, dynamic> json) =>
      OrderDetailModel(
        id: json["id"] ?? 0,
        waterBill: json["water_bill"] ?? 0,
        electricity: json["electricity"] ?? 0,
        months: json["months"] ?? "",
        total: json["total"] ?? 0,
        waterUsed: json["water_used"] ?? 0,
        electricityConsumption: json["electricity_consumption"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "water_bill": waterBill,
    "electricity": electricity,
    "months": months,
    "total": total,
    "water_used": waterUsed,
    "electricity_consumption": electricityConsumption,
  };
}
