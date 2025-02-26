import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tenement/models/user_model.dart';
import 'package:flutter_tenement/network/api.dart';
import 'package:flutter_tenement/widgets/cell_widget.dart';
import 'package:flutter_tenement/widgets/shimmer_widget.dart';
import 'package:ftoast/ftoast.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String roomNumber = '';
  String inTime = '';
  String paidFormat = '';
  String rentDeposit = '';
  String utilityDeposits = '';
  String nextRentPayTime = '';
  bool loading = false;

  @override
  void initState() {
    super.initState();
    _getUserRoom();
  }

  // 获取租房信息
  Future<void> _getUserRoom() async {
    try {
      setState(() {
        loading = true;
      });
      UserResponse res = await GetUserByRoomAPI.getCreateData();
      setState(() {
        loading = false;
      });
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
        roomNumber = res.data!.roomNumber.toString();
        inTime = res.data!.inTime!;
        paidFormat =
            res.data!.paidFormat! == 1
                ? "月付"
                : res.data!.paidFormat! == 2
                ? "季付"
                : res.data!.paidFormat! == 3
                ? "半年"
                : "年付";
        rentDeposit = MoneyUtil.changeFStr2YWithUnit(
          res.data!.rentDeposit.toString(),
        );
        utilityDeposits = MoneyUtil.changeFStr2YWithUnit(
          res.data!.utilityDeposits.toString(),
        );
        nextRentPayTime = res.data!.nextRentPayTime!;
      });
    } catch (e) {
      setState(() {
        loading = false;
      });
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
    return Container(
      padding: EdgeInsets.zero,
      margin: EdgeInsets.only(top: 5, bottom: 5),
      child:
          !loading
              ? Column(
                children: [
                  HCCell(label: "房间号", value: roomNumber),
                  HCCell(label: "入住时间", value: inTime),
                  HCCell(label: "房租押金", value: "￥$rentDeposit"),
                  HCCell(label: "水电押金", value: "￥$utilityDeposits"),
                  HCCell(label: "付费方式", value: paidFormat),
                  HCCell(
                    label: "下次房租缴费时间",
                    value: nextRentPayTime,
                    isBorder: false,
                  ),
                ],
              )
              : HCShimmer(),
    );
  }
}
