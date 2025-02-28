import 'package:flutter/material.dart';
import 'package:flutter_tenement/models/password_model.dart';
import 'package:flutter_tenement/network/api.dart';
import 'package:flutter_tenement/widgets/button_widget.dart';
import 'package:flutter_tenement/widgets/input_widget.dart';
import 'package:ftoast/ftoast.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  void _onFinish() async {
    String oldPassword = _oldPasswordController.value.text;
    String newPassword = _newPasswordController.value.text;
    String confirmPassword = _confirmPasswordController.value.text;

    if (oldPassword.length < 8) {
      FToast.toast(
        context,
        duration: 800,
        msg: '请输入旧密码',
        msgStyle: const TextStyle(color: Colors.white),
      );
      return;
    }

    if (newPassword.length < 8) {
      FToast.toast(
        context,
        duration: 800,
        msg: '请输入新密码',
        msgStyle: const TextStyle(color: Colors.white),
      );
      return;
    }

    if (newPassword != confirmPassword) {
      FToast.toast(
        context,
        duration: 800,
        msg: '输入的确认密码和新密码不一样',
        msgStyle: const TextStyle(color: Colors.white),
      );
      return;
    }

    try {
      PasswordResponse res = await ChangePasswordAPI.getCreateData(
        oldPassword: oldPassword,
        newPassword: newPassword,
      );
      if (res.code != 100001) {
        FToast.toast(
          context,
          duration: 1800,
          msg: res.message,
          msgStyle: const TextStyle(color: Colors.white),
        );
        return;
      }

      FToast.toast(
        context,
        duration: 1800,
        msg: "密码修改成功",
        msgStyle: const TextStyle(color: Colors.white),
      );
      Navigator.pushNamedAndRemoveUntil(context, "/home", (route) => false);
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
      child: Container(
        padding: EdgeInsets.only(top: 20, left: 20, right: 20),
        child: Column(
          children: [
            HCInput(
              controller: _oldPasswordController,
              hintText: "请输入旧密码",
              obscureText: false,
              icon: Icons.lock,
            ),
            const Padding(padding: EdgeInsets.only(top: 20)),
            HCInput(
              controller: _newPasswordController,
              hintText: "请输入新密码",
              obscureText: false,
              icon: Icons.lock,
            ),
            const Padding(padding: EdgeInsets.only(top: 20)),
            HCInput(
              controller: _confirmPasswordController,
              hintText: "请确认新密码",
              obscureText: false,
              icon: Icons.lock,
            ),
            const Padding(padding: EdgeInsets.only(top: 20)),
            HCButton(text: "确认修改", onPressed: () => _onFinish()),
          ],
        ),
      ),
    );
  }
}
