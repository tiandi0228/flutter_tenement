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
        padding: const EdgeInsets.only(top: 20, bottom: 20),
        margin: EdgeInsets.only(left: 20),
        decoration: BoxDecoration(
          border: Border(
            bottom:
                widget.isBorder != null
                    ? BorderSide.none
                    : BorderSide(width: 1, color: Colors.grey.shade300),
          ),
        ),
        child: Row(
          children: [
            Text(widget.label),
            Expanded(
              flex: 1,
              child: Text(widget.value, textAlign: TextAlign.right),
            ),
            Padding(padding: EdgeInsets.only(right: 20)),
          ],
        ),
      ),
    );
  }
}
