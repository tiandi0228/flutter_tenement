import 'package:flutter/material.dart';
import 'package:flutter_tenement/widgets/button_widget.dart';
import 'package:flutter_tenement/widgets/input_widget.dart';
import 'package:flutter_tenement/widgets/timer_count_down_button_widget.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _pwdController = TextEditingController();

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
                      controller: _pwdController,
                      hintText: '请输入4位验证码',
                      icon: Icons.safety_check,
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(left: 20)),
                  Expanded(
                    child: HCTimerCountDownButton(onFinish: (){}),
                  ),
                ],
              ),
              const Padding(padding: EdgeInsets.only(top: 20)),
              HCButton(text: "登录"),
            ],
          ),
        ),
      ),
    );
  }
}
