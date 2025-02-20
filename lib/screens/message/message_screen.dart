import 'package:flutter/material.dart';
import 'package:flutter_tenement/screens/message/widgets/body.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "消息",
          softWrap: true,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
      ),
      body: Body()
    );
  }
}
