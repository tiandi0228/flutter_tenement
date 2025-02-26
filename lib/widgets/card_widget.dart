import 'package:flutter/material.dart';

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
        padding: const EdgeInsets.only(left: 20),
        margin: EdgeInsets.only(left: 10, right: 10, top: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              blurRadius: 3, //阴影范围
              spreadRadius: 0.1, //阴影浓度
              color: const Color.fromARGB(20, 0, 0, 0), //阴影颜色
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 10, bottom: 10, right: 10),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 0, color: Colors.grey.shade300),
                ),
              ),
              child: Row(
                children: [
                  Text(
                    '缴费年份：${widget.year}',
                    style: TextStyle(color: Colors.grey),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      '查看详情>',
                      textAlign: TextAlign.right,
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 0, color: Colors.grey.shade300),
                ),
              ),
              child: Row(
                children: [
                  Text.rich(
                    TextSpan(
                      text: "总计金额：",
                      style: TextStyle(color: Colors.black),
                      children: [
                        TextSpan(
                          text: "￥${widget.money}",
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 0, color: Colors.grey.shade300),
                ),
              ),
              child: Row(
                children: [
                  Text.rich(
                    TextSpan(
                      text: "水使水量：",
                      style: TextStyle(color: Colors.black),
                      children: [
                        TextSpan(
                          text: "${widget.water} m³",
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Row(
                children: [
                  Text.rich(
                    TextSpan(
                      text: "总计电量：",
                      style: TextStyle(color: Colors.black),
                      children: [
                        TextSpan(
                          text: "${widget.kWh} kWh",
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
