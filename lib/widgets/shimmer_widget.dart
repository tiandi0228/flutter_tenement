import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class HCShimmer extends StatefulWidget {
  const HCShimmer({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HCShimmerState();
  }
}

class _HCShimmerState extends State<HCShimmer> {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      enabled: true,
      child: Container(
        width: MediaQuery.of(context).size.width - 20,
        height: 120,
        margin: EdgeInsets.only(top: 10, left: 10, right: 10),
        color: const Color(0xFFFFFFFF),
      ),
    );
  }
}
