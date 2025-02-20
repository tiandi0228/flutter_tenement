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
          HCCell(label: "房间号", value: "2"),
          HCCell(label: "入住时间", value: "2024-03-29"),
          HCCell(label: "房租押金", value: "700"),
          HCCell(label: "水电押金", value: "300"),
          HCCell(label: "付费方式", value: "半年"),
        ],
      ),
    );
  }
}
