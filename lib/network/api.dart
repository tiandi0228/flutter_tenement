import 'package:flutter_tenement/models/captcha_model.dart';
import 'package:flutter_tenement/models/login_model.dart';
import 'package:flutter_tenement/models/order_detail_model.dart';
import 'package:flutter_tenement/models/order_model.dart';
import 'package:flutter_tenement/models/upgrade_model.dart';
import 'package:flutter_tenement/models/user_model.dart';
import 'package:flutter_tenement/network/network_manager.dart';

// 登录
class LoginAPI {
  static Future<dynamic> getCreateData({
    required String phone,
    required int captcha,
  }) async {
    var res = await NetworkManager().post(
      'login',
      params: {"phone": phone, "captcha": captcha},
    );

    return LoginResponse.fromJson(res);
  }
}

// 获取验证码
class GetCodeAPI {
  static Future<dynamic> getCreateData({required String phone}) async {
    var res = await NetworkManager().post('captcha', params: {"phone": phone});
    if (res == null) return CaptchaResponse();
    return CaptchaResponse.fromJson(res);
  }
}

// 获取租房信息
class GetUserByRoomAPI {
  static Future<dynamic> getCreateData() async {
    var res = await NetworkManager().get('user/room');
    return UserResponse.fromJson(res);
  }
}

// 获取用户信息
class GetUserAPI {
  static Future<dynamic> getCreateData() async {
    var res = await NetworkManager().get('user');
    return UserResponse.fromJson(res);
  }
}

// 获取缴费记录
class GetOrderAPI {
  static Future<dynamic> getCreateData() async {
    var res = await NetworkManager().get('order');
    return OrderResponse.fromJson(res);
  }
}

// 获取缴费详情
class GetOrderYearAPI {
  static Future<dynamic> getCreateData({required String year}) async {
    var res = await NetworkManager().get('order/year', params: {"year": year});
    return OrderDetailResponse.fromJson(res);
  }
}

// 版本升级
class UpgradeAPI {
  static Future<dynamic> getCreateData({required String version}) async {
    var res = await NetworkManager().post(
      'upgrade',
      params: {"version": version},
    );
    return UpgradeResponse.fromJson(res);
  }
}
