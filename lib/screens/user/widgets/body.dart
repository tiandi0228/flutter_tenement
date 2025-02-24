import 'package:flutter/material.dart';
import 'package:flutter_tenement/models/user_model.dart';
import 'package:flutter_tenement/network/api.dart';
import 'package:flutter_tenement/widgets/cell_widget.dart';
import 'package:ftoast/ftoast.dart';
import 'package:hive/hive.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String name = '';
  String phone = '';

  @override
  void initState() {
    super.initState();
    _getUser();
  }

  // 获取用户信息
  Future<void> _getUser() async {
    try {
      UserResponse res = await GetUserAPI.getCreateData();
      if (res.code != 100001) {
        FToast.toast(
          context,
          duration: 800,
          msg: res.message,
          msgStyle: const TextStyle(color: Colors.white),
        );
        return;
      }

      setState(() {
        name = res.data!.name!;
        phone = res.data!.phone!;
      });
    } catch (e) {
      FToast.toast(
        context,
        duration: 1800,
        msg: "$e",
        msgStyle: const TextStyle(color: Colors.white),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5, bottom: 5),
      child: Column(
        children: [
          HCCell(label: "姓名", value: name),
          HCCell(label: "手机号码", value: phone, isBorder: false),
        ],
      ),
    );
  }
}
