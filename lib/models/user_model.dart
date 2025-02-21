import 'dart:convert';

UserResponse userModelFromJson(String str) =>
    UserResponse.fromJson(json.decode(str));

String userModelToJson(UserResponse data) => json.encode(data.toJson());

class UserResponse {
  int code;
  String message;
  UserModel? data;

  UserResponse({required this.code, required this.message, required this.data});

  factory UserResponse.fromJson(Map<String, dynamic> json) => UserResponse(
    code: json['code'],
    message: json['message'],
    data: json['data'] == null ? null : UserModel.fromJson(json['data']),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
    "data": data,
  };
}

class UserModel {
  UserModel({
    this.rentDeposit,
    this.utilityDeposits,
    this.inTime,
    this.phone,
    this.id,
    this.paidFormat,
    this.roomNumber,
    this.nextRentPayTime,
    this.name,
  });

  String? name;
  int? rentDeposit;
  int? utilityDeposits;
  String? inTime;
  String? phone;
  int? id;
  int? paidFormat;
  int? roomNumber;
  String? nextRentPayTime;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    name: json["name"] ?? '',
    inTime: json["in_time"] ?? '',
    phone: json["phone"] ?? '',
    id: json["id"] ?? 0,
    rentDeposit: json["rent_deposit"] ?? 0,
    utilityDeposits: json["utility_deposits"] ?? 0,
    paidFormat: json["paid_format"] ?? 0,
    roomNumber: json["room_number"] ?? 0,
    nextRentPayTime: json["next_rent_pay_time"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "in_time": inTime,
    "phone": phone,
    "id": id,
    "rent_deposit": rentDeposit,
    "utility_deposits": utilityDeposits,
    "paid_format": paidFormat,
    "room_number": roomNumber,
    "next_rent_pay_time": nextRentPayTime,
  };
}
