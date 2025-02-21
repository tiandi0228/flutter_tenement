import 'package:flutter/material.dart';
import 'package:flutter_tenement/screens/login/widgets/body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "登录",
          softWrap: true,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
      ),
      body: Body(),
    );
  }
}
