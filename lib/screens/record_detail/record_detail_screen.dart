import 'package:flutter/material.dart';
import 'package:flutter_tenement/screens/record_detail/widgets/body.dart';

class RecordDetailScreen extends StatelessWidget {
  final String year;

  const RecordDetailScreen({super.key, required this.year});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "缴费详情",
          softWrap: true,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
      ),
      body: Body(year: year),
    );
  }
}
