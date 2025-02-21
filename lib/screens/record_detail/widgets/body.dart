import 'package:flutter/material.dart';
import 'package:flutter_tenement/widgets/cell_widget.dart';
import 'package:shimmer/shimmer.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List list = [
    '01',
    '02',
    '03',
    '04',
    '05',
    '06',
    '07',
    '08',
    '09',
    '10',
    '11',
    '12',
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child:
          list.isEmpty
              ? Column(
                children:
                    [1, 2, 3, 4, 5, 6, 7, 8].map((item) => _shimmer()).toList(),
              )
              : Column(
                children:
                    list
                        .map(
                          (item) => Container(
                            margin: EdgeInsets.only(top: 5, bottom: 5),
                            color: Colors.white,
                            child: Column(
                              children: [
                                HCCell(label: "账单月份", value: "2024-$item"),
                                HCCell(label: "账单金额", value: "￥200.00"),
                                HCCell(label: "本月水量", value: "200 m³"),
                                HCCell(label: "本月水费", value: "￥100.00"),
                                HCCell(label: "本月电量", value: "200 kWh"),
                                HCCell(
                                  label: "本月电费",
                                  value: "￥100.00",
                                  isBorder: false,
                                ),
                              ],
                            ),
                          ),
                        )
                        .toList(),
              ),
    );
  }

  // 骨架
  Widget _shimmer() {
    return Column(
      children: [
        Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          enabled: true,
          child: Container(
            width: MediaQuery.of(context).size.width - 20,
            height: 120,
            margin: EdgeInsets.only(top: 10, left: 10, right: 10),
            color: const Color(0xFFFFFFFF),
          ),
        ),
      ],
    );
  }
}
