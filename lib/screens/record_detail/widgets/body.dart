import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tenement/models/order_detail_model.dart';
import 'package:flutter_tenement/network/api.dart';
import 'package:flutter_tenement/widgets/cell_widget.dart';
import 'package:ftoast/ftoast.dart';
import 'package:shimmer/shimmer.dart';

class Body extends StatefulWidget {
  final String year;
  const Body({super.key, required this.year});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<OrderDetailModel> list = [];

  @override
  void initState() {
    super.initState();

    _getOrderDetail();
  }

  // 获取缴费详情
  Future<void> _getOrderDetail() async {
    debugPrint("年份：${widget.year}");
    try {
      OrderDetailResponse res = await GetOrderYearAPI.getCreateData(
        year: widget.year,
      );
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
                children:
                    [1, 2, 3, 4, 5, 6, 7, 8].map((item) => _shimmer()).toList(),
              )
              : Column(
                children:
                    list
                        .map(
                          (item) => Container(
                            margin: EdgeInsets.only(
                              left: 10,
                              right: 10,
                              top: 10,
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 15),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      item.months,
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                ),
                                HCCell(
                                  label: "账单金额",
                                  value:
                                      "￥${MoneyUtil.changeFStr2YWithUnit(item.total.toString())}",
                                ),
                                HCCell(
                                  label: "本月水量",
                                  value: "${item.waterUsed} m³",
                                ),
                                HCCell(
                                  label: "本月水费",
                                  value:
                                      "￥${MoneyUtil.changeFStr2YWithUnit(item.waterBill.toString())}",
                                ),
                                HCCell(
                                  label: "本月电量",
                                  value: "${item.electricityConsumption} kWh",
                                ),
                                HCCell(
                                  label: "本月电费",
                                  value:
                                      "￥${MoneyUtil.changeFStr2YWithUnit(item.electricity.toString())}",
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
