import 'package:flutter/material.dart';
import 'package:flutter_tenement/screens/house/widgets/body.dart';

class HouseScreen extends StatelessWidget {
  const HouseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "租房信息",
          softWrap: true,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
      ),
      body: Body()
    );
  }
}
