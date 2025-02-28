import 'package:flutter/material.dart';
import 'package:flutter_tenement/models/menu_model.dart';
import 'package:flutter_tenement/models/upgrade_model.dart';
import 'package:flutter_tenement/network/api.dart';
import 'package:flutter_tenement/utils/notification_util.dart';
import 'package:flutter_tenement/widgets/small_window_widget.dart';
import 'package:permission_handler/permission_handler.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> with WidgetsBindingObserver {
  List<Menu> menus = [
    Menu(
      title: '租房信息',
      path: '/house-info',
      icon: Icons.house_outlined,
      iconColor: Colors.lightBlue,
    ),
    Menu(
      title: '个人信息',
      path: '/user-info',
      icon: Icons.person_outline,
      iconColor: Colors.red,
    ),
    Menu(
      title: '缴费记录',
      path: '/payment-records',
      icon: Icons.receipt_outlined,
      iconColor: Colors.deepOrange,
    ),
    Menu(
      title: '密码管理',
      path: '/password',
      icon: Icons.lock_outline,
      iconColor: Colors.green,
    ),
  ];

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      // _notification();
      if (mounted) {
        _upgrade();
      }
    });
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  // 通知
  Future<void> _notification() async {
    var status = await Permission.notification.status;
    if (status.isGranted) {
      debugPrint("isGranted true");
      NotificationService().showNotification(
        title: '水电费缴费通知',
        body: '你好，今天是水电费缴费时间，请拍照片发房东',
      );
      return;
    } else {
      debugPrint("isGranted false");
    }
  }

  // 版本升级
  Future<void> _upgrade() async {
    try {
      UpgradeResponse res = await UpgradeAPI.getCreateData(version: '1.0.1');
      if (res.code == 100001 && res.data != null && res.data?.content != "") {
        SmallWindow().show(context, res.data as UpgradeModel);
      }
    } catch (e) {
      debugPrint("获取升级错误: $e");
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    super.didChangeAppLifecycleState(state);

    if (AppLifecycleState.resumed == state) {
      debugPrint("进入app");
    } else if (AppLifecycleState.hidden == state) {
      debugPrint("隐藏app");
    } else if (AppLifecycleState.detached == state) {
      debugPrint("隐藏app");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 15),
      margin: EdgeInsets.only(left: 10, right: 10, top: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            blurRadius: 3, //阴影范围
            spreadRadius: 0.1, //阴影浓度
            color: const Color.fromARGB(20, 0, 0, 0), //阴影颜色
          ),
        ],
      ),
      child: GridView.count(
        padding: EdgeInsets.zero,
        crossAxisSpacing: 0,
        crossAxisCount: 4,
        mainAxisSpacing: 0,
        childAspectRatio: (MediaQuery.of(context).size.width / 4) / 80,
        shrinkWrap: true,
        children:
            menus
                .map(
                  (item) => InkWell(
                    onTap: () async {
                      if (item.path == '/login') {
                        return;
                      }
                      Navigator.pushNamed(context, item.path);
                    },
                    child: Column(
                      children: [
                        Icon(item.icon, color: item.iconColor, size: 30),
                        Padding(padding: EdgeInsets.only(bottom: 10)),
                        Text(item.title),
                      ],
                    ),
                  ),
                )
                .toList(),
      ),
    );
  }
}
