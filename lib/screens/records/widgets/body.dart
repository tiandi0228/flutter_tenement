import 'package:flutter/material.dart';
import 'package:flutter_tenement/widgets/card_widget.dart';
import 'package:shimmer/shimmer.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List list = ['1','2','3'];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child:
          list.isEmpty
              ? Column(
                children: [1, 2, 3, 4, 5].map((item) => _shimmer()).toList(),
              )
              : Column(
                children:
                    list
                        .map(
                          (item) => HCCard(
                            year: "2024",
                            money: "2000.00",
                            water: "2000",
                            kWh: "2000",
                            onPressed:
                                () => {
                                  Navigator.pushNamed(
                                    context,
                                    "/payment-record-detail/1",
                                  ),
                                },
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
