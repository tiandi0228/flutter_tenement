import 'package:flutter/material.dart';
import 'package:flutter_tenement/widgets/cell.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          HCCell(label: "姓名", value: "张三"),
          HCCell(
            label: "手机号码",
            value: "13867820265",
            onPressed: () {
              print("点击了手机号码");
            },
          ),
        ],
      ),
    );
  }
}
