import 'package:flutter/material.dart';
import 'package:flutter_tenement/model/menu.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<Menu> menus = [
    Menu(
      title: '租房信息',
      path: '/house-info',
      icon: Icons.house_outlined,
      iconColor: Colors.lightBlue,
    ),
    Menu(
      title: '个人信息',
      path: '/user-info',
      icon: Icons.person_outline,
      iconColor: Colors.red,
    ),
    Menu(
      title: '缴费记录',
      path: '/payment-records',
      icon: Icons.receipt_outlined,
      iconColor: Colors.deepOrange,
    ),
    Menu(
      title: '常用电话',
      path: '/',
      icon: Icons.phone_in_talk_outlined,
      iconColor: Colors.green,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: GridView.count(
        padding: EdgeInsets.zero,
        crossAxisSpacing: 10,
        crossAxisCount: 4,
        mainAxisSpacing: 10,
        shrinkWrap: true,
        children:
            menus
                .map(
                  (item) => InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, item.path);
                    },
                    child: Container(
                      padding: EdgeInsets.zero,
                      child: Column(
                        children: [
                          Icon(item.icon, color: item.iconColor, size: 30),
                          Padding(padding: EdgeInsets.only(bottom: 10)),
                          Text(item.title),
                        ],
                      ),
                    ),
                  ),
                )
                .toList(),
      ),
    );
  }
}
