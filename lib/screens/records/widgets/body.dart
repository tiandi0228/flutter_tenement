import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tenement/models/order_model.dart';
import 'package:flutter_tenement/network/api.dart';
import 'package:flutter_tenement/widgets/card_widget.dart';
import 'package:ftoast/ftoast.dart';
import 'package:shimmer/shimmer.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<OrderModel> list = [];

  @override
  void initState() {
    super.initState();
    _getOrder();
  }

  // 获取缴费记录
  Future<void> _getOrder() async {
    try {
      OrderResponse res = await GetOrderAPI.getCreateData();
      debugPrint("数据：$res");
      if (res.code != 100001) {
        FToast.toast(
          context,
          duration: 800,
          msg: res.message,
          msgStyle: const TextStyle(color: Colors.white),
        );
        return;
      }

      setState(() {
        list = res.data!;
      });
    } catch (e) {
      debugPrint("错误：$e");
      FToast.toast(
        context,
        duration: 1800,
        msg: "$e",
        msgStyle: const TextStyle(color: Colors.white),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.only(bottom: 40),
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
                            year: item.year,
                            money: MoneyUtil.changeFStr2YWithUnit(item.total.toString()),
                            water: "${item.waterUsed}",
                            kWh: "${item.electricityConsumption}",
                            onPressed:
                                () => {
                                  Navigator.pushNamed(
                                    context,
                                    "/payment-record-detail/${item.year}",
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
