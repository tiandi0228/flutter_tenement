import 'package:flutter/material.dart';
import 'package:flutter_tenement/screens/record_detail/widgets/body.dart';

class RecordDetailScreen extends StatelessWidget {
  const RecordDetailScreen({super.key});

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
      body: Body(),
    );
  }
}
