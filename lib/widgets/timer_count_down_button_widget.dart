import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_tenement/widgets/button_widget.dart';

class HCTimerCountDownButton extends StatefulWidget {
  final Function onFinish;

  const HCTimerCountDownButton({super.key, required this.onFinish});

  @override
  State<StatefulWidget> createState() {
    return _HCTimerCountDownButtonState();
  }
}

class _HCTimerCountDownButtonState extends State<HCTimerCountDownButton> {
  late Timer _timer;
  int _countdownTime = 0;
  @override
  Widget build(BuildContext context) {
    return HCButton(
      text: _countdownTime > 0 ? "${_countdownTime}s后重新获取" : "获取验证码",
      backgroundColor: _countdownTime > 0 ? Colors.grey : Color(0xFFFC2053),
      onPressed: () {
        if (_countdownTime == 0) {
          setState(() {
            _countdownTime = 60;
          });
          //开始倒计时
          startCountdownTimer();
        }
      },
    );
  }

  // 开始倒计时
  void startCountdownTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      setState(() {
        if (_countdownTime < 1) {
          widget.onFinish();
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
