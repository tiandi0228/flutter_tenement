import 'package:flutter/material.dart';
import 'package:flutter_tenement/screens/user/widgets/body.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "个人信息",
          softWrap: true,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
      ),
      body: Body(),
    );
  }
}
