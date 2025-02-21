import 'dart:async';

import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tenement/models/captcha_model.dart';
import 'package:flutter_tenement/network/api.dart';
import 'package:flutter_tenement/widgets/button_widget.dart';
import 'package:ftoast/ftoast.dart';

class TimerCountDownButton extends StatefulWidget {
  final String phone;

  const TimerCountDownButton({super.key, required this.phone});

  @override
  State<StatefulWidget> createState() {
    return _TimerCountDownButtonState();
  }
}

class _TimerCountDownButtonState extends State<TimerCountDownButton> {
  late Timer _timer;
  int _countdownTime = 0;
  @override
  Widget build(BuildContext context) {
    return HCButton(
      text: _countdownTime > 0 ? "${_countdownTime}s后重新获取" : "获取验证码",
      backgroundColor: _countdownTime > 0 ? Colors.grey : Color(0xFFFC2053),
      onPressed: () {
        if (_countdownTime == 0) {
          _onGetCode(context);
        }
      },
    );
  }

  // 获取验证码
  Future<void> _onGetCode(BuildContext context) async {
    String phone = widget.phone;
    if (!RegexUtil.isMobileExact(phone)) {
      FToast.toast(
        context,
        duration: 800,
        msg: '请输入手机号码',
        msgStyle: const TextStyle(color: Colors.white),
      );
      return;
    }
    debugPrint(phone);

    CaptchaResponse res = await GetCodeAPI.getCreateData(phone: phone);
    debugPrint(res.message);
    if (res.code != 100001) {
      FToast.toast(
        context,
        duration: 800,
        msg: res.message ?? '短信验证码发送失败，请重试',
        msgStyle: const TextStyle(color: Colors.white),
      );
      return;
    }

    setState(() {
      _countdownTime = 60;
    });
    //开始倒计时
    startCountdownTimer();
    FToast.toast(
      context,
      duration: 800,
      msg: '短信验证码已发送，请注意查收',
      msgStyle: const TextStyle(color: Colors.white),
    );
  }

  // 开始倒计时
  void startCountdownTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      setState(() {
        if (_countdownTime < 1) {
          _timer.cancel();
        } else {
          _countdownTime -= 1;
        }
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }
}
