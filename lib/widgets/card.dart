import 'package:flutter/material.dart';
import 'package:flutter_tenement/config/constants.dart';

class HCCard extends StatefulWidget {
  final Function? onPressed;
  final String year;
  final String money;
  final String water;
  final String kWh;

  const HCCard({
    super.key,
    this.onPressed,
    required this.year,
    required this.money,
    required this.water,
    required this.kWh,
  });

  @override
  State<StatefulWidget> createState() {
    return _HCCardState();
  }
}

class _HCCardState extends State<HCCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => widget.onPressed?.call(),
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(top: 5),
        color: cardColor,
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  '缴费年份：${widget.year}',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    '查看详情>',
                    textAlign: TextAlign.right,
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ),
              ],
            ),
            Padding(padding: EdgeInsets.only(top: 10)),
            Row(
              children: [
                Text.rich(
                  TextSpan(
                    text: "总计金额：",
                    style: TextStyle(color: Colors.black, fontSize: 12),
                    children: [
                      TextSpan(
                        text: "${widget.money} 元",
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(padding: EdgeInsets.only(top: 10)),
            Row(
              children: [
                Text.rich(
                  TextSpan(
                    text: "水使水量：",
                    style: TextStyle(color: Colors.black, fontSize: 12),
                    children: [
                      TextSpan(
                        text: "${widget.water} 吨",
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(padding: EdgeInsets.only(top: 10)),
            Row(
              children: [
                Text.rich(
                  TextSpan(
                    text: "总计电量：",
                    style: TextStyle(color: Colors.black, fontSize: 12),
                    children: [
                      TextSpan(
                        text: "${widget.kWh} 度",
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
