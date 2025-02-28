import 'dart:math' as developer;

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tenement/router/router_handler.dart';

class MyRouter {
  static FluroRouter router = FluroRouter();

  static void configureRoutes(FluroRouter router) {
    router.notFoundHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
        developer.log("ROUTE WAS NOT FOUND !!!" as num);
        return;
      },
    );

    // 首页
    router.define(
      '/home',
      handler: homeScreenHandler,
      transitionType: TransitionType.inFromLeft,
    );

    // 租房信息
    router.define(
      '/house-info',
      handler: houseScreenHandler,
      transitionType: TransitionType.inFromRight,
    );

    // 个人信息
    router.define(
      '/user-info',
      handler: userScreenHandler,
      transitionType: TransitionType.inFromRight,
    );

    // 消息
    router.define(
      '/message',
      handler: messageScreenHandler,
      transitionType: TransitionType.inFromRight,
    );

    // 缴费记录
    router.define(
      '/payment-records',
      handler: recordsScreenHandler,
      transitionType: TransitionType.inFromRight,
    );

    // 缴费详情
    router.define(
      '/payment-record-detail/:year',
      handler: recordDetailScreenHandler,
      transitionType: TransitionType.inFromRight,
    );

    // 登录
    router.define(
      '/login',
      handler: loginScreenHandler,
      transitionType: TransitionType.inFromRight,
    );

    // 密码管理
    router.define(
      '/password',
      handler: passwordScreenHandler,
      transitionType: TransitionType.inFromRight,
    );
  }
}
