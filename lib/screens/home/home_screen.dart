import 'package:flutter/material.dart';
import 'package:flutter_tenement/screens/home/widgets/body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "首页",
          softWrap: true,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.message),
            onPressed: () {
              Navigator.pushNamed(context, "/message");
            },
          ),
        ],
      ),
      body: Body(),
    );
  }
}
