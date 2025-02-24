import 'package:flutter/material.dart';

class HCCell extends StatefulWidget {
  final Function? onPressed;
  final String label;
  final String value;
  final bool? isBorder;

  const HCCell({
    super.key,
    this.onPressed,
    required this.label,
    required this.value,
    this.isBorder,
  });

  @override
  State<StatefulWidget> createState() {
    return _HCCellState();
  }
}

class _HCCellState extends State<HCCell> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => widget.onPressed?.call(),
      child: Container(
        padding: const EdgeInsets.only(
          top: 20,
          left: 20,
          bottom: 20,
          right: 20,
        ),
        margin: EdgeInsets.only(left: 10, right: 10, top: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          border: Border(
            bottom:
                widget.isBorder != null
                    ? BorderSide.none
                    : BorderSide(width: 1, color: Colors.grey.shade300),
          ),
          boxShadow: [
            BoxShadow(
              blurRadius: 3, //阴影范围
              spreadRadius: 0.1, //阴影浓度
              color: const Color.fromARGB(20, 0, 0, 0), //阴影颜色
            ),
          ],
        ),
        child: Row(
          children: [
            Text(widget.label),
            Expanded(
              flex: 1,
              child: Text(
                widget.value,
                textAlign: TextAlign.right,
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
