import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tenement/models/login_model.dart';
import 'package:flutter_tenement/network/api.dart';
import 'package:flutter_tenement/widgets/button_widget.dart';
import 'package:flutter_tenement/widgets/input_widget.dart';
import 'package:flutter_tenement/screens/login/widgets/timer_count_down_button_widget.dart';
import 'package:ftoast/ftoast.dart';
import 'package:hive/hive.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _codeController = TextEditingController();

  // 登录
  Future<void> _onLogin(BuildContext context) async {
    String phone = _phoneController.value.text;
    String code = _codeController.value.text;

    if (!RegexUtil.isMobileExact(phone)) {
      FToast.toast(
        context,
        duration: 800,
        msg: '请输入手机号码',
        msgStyle: const TextStyle(color: Colors.white),
      );
      return;
    }

    if (code.length < 4) {
      FToast.toast(
        context,
        duration: 800,
        msg: '请输入验证码',
        msgStyle: const TextStyle(color: Colors.white),
      );
      return;
    }

    LoginResponse res = await LoginAPI.getCreateData(
      phone: phone,
      captcha: int.parse(code),
    );

    if (res.code != 100001) {
      FToast.toast(
        context,
        duration: 800,
        msg: res.message,
        msgStyle: const TextStyle(color: Colors.white),
      );
      return;
    }

    LoginModel? resp = res.data;
    if (resp!.accessToken.isNotEmpty) {
      var box = Hive.box('Box');
      box.put('access-token', resp.accessToken);
      box.put('phone', resp.phone);
      Navigator.pushNamedAndRemoveUntil(context, "/home", (route) => false);
      FToast.toast(
        context,
        duration: 800,
        msg: '登录成功',
        msgStyle: const TextStyle(color: Colors.white),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.zero,
      color: Colors.white,
      child: Center(
        child: Container(
          padding: EdgeInsets.zero,
          width: MediaQuery.of(context).size.width - 40,
          height: MediaQuery.of(context).size.height - 400,
          child: Column(
            children: [
              Image.asset("assets/images/logo.png", width: 120, height: 120),
              Padding(padding: EdgeInsets.only(top: 40)),
              HCInput(
                controller: _phoneController,
                hintText: '请输入手机号码',
                icon: Icons.phone_iphone,
              ),
              const Padding(padding: EdgeInsets.only(top: 20)),
              Row(
                children: [
                  Expanded(
                    child: HCInput(
                      controller: _codeController,
                      hintText: '请输入4位验证码',
                      icon: Icons.safety_check,
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(left: 20)),
                  Expanded(
                    child: TimerCountDownButton(
                      phone: _phoneController.value.text,
                    ),
                  ),
                ],
              ),
              const Padding(padding: EdgeInsets.only(top: 20)),
              HCButton(text: "登录", onPressed: () => _onLogin(context)),
            ],
          ),
        ),
      ),
    );
  }
}
