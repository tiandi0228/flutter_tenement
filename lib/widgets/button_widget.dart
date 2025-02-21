import 'package:flutter/material.dart';

class HCButton extends StatefulWidget {
  final Function onPressed;
  final String text;
  final Color? backgroundColor;
  final Color? textColor;

  const HCButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.backgroundColor = const Color(0xFF0171F7),
    this.textColor = const Color(0xFFFFFFFF),
  });

  @override
  State<StatefulWidget> createState() {
    return _HCButtonState();
  }
}

class _HCButtonState extends State<HCButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      padding: EdgeInsets.zero,
      child: TextButton(
        onPressed: () => widget.onPressed.call(),
        style: ButtonStyle(
          minimumSize: WidgetStateProperty.all(const Size(100, 40)),
          padding: WidgetStateProperty.all(EdgeInsets.zero),
          backgroundColor: WidgetStateProperty.all(widget.backgroundColor),
          overlayColor: WidgetStateProperty.all(Colors.transparent),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ),
        child: Text(
          widget.text,
          style: TextStyle(
            color: widget.textColor,
            fontSize: 18,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}