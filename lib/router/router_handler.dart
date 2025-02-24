import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tenement/screens/home/home_screen.dart';
import 'package:flutter_tenement/screens/house/house_screen.dart';
import 'package:flutter_tenement/screens/login/login_screen.dart';
import 'package:flutter_tenement/screens/message/message_screen.dart';
import 'package:flutter_tenement/screens/record_detail/record_detail_screen.dart';
import 'package:flutter_tenement/screens/records/records_screen.dart';
import 'package:flutter_tenement/screens/user/user_screen.dart';

// 首页
var homeScreenHandler = Handler(
  handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    return const HomeScreen();
  },
);

// 租房信息
var houseScreenHandler = Handler(
  handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    return const HouseScreen();
  },
);

// 个人信息
var userScreenHandler = Handler(
  handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    return const UserScreen();
  },
);

// 消息
var messageScreenHandler = Handler(
  handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    return const MessageScreen();
  },
);

// 缴费记录
var recordsScreenHandler = Handler(
  handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    return const RecordsScreen();
  },
);

// 缴费详情
var recordDetailScreenHandler = Handler(
  handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    String? year = params["year"]?.first;
    return RecordDetailScreen(year: year ?? "");
  },
);

// 登录
var loginScreenHandler = Handler(
  handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    return const LoginScreen();
  },
);
