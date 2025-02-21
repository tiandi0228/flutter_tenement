import 'package:flutter/material.dart';

class HCInput extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  final bool? obscureText;
  final IconData? icon;

  const HCInput({
    super.key,
    this.controller,
    this.hintText = '',
    this.obscureText,
    this.icon,
  });

  @override
  State<StatefulWidget> createState() {
    return _HCInputState();
  }
}

class _HCInputState extends State<HCInput> {
  bool hidden = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      hidden = widget.obscureText == null ? false : true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      padding: EdgeInsets.zero,
      child: TextFormField(
        controller: widget.controller,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(
            left: 14.0,
            bottom: 8.0,
            top: 8.0,
          ),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black38, width: 0.5),
            borderRadius: BorderRadius.circular(4),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black38, width: 0.5),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black38, width: 0.5),
          ),
          hoverColor: const Color(0xFFFAFAFA),
          hintText: widget.hintText,
          hintStyle: const TextStyle(fontSize: 14, color: Colors.black26),
          prefixIcon: widget.icon == null ? null : Align(widthFactor: 1.0, heightFactor: 1.0, child: Icon(widget.icon,color: Colors.grey,)),
          suffixIcon:
              widget.obscureText != null
                  ? IconButton(
                    onPressed: () {
                      setState(() {
                        hidden = !hidden;
                      });
                    },
                    icon: Icon(
                      hidden
                          ? Icons.remove_red_eye_rounded
                          : Icons.remove_red_eye_outlined,
                    ),
                  )
                  : null,
        ),
        obscureText: hidden,
        cursorColor: Colors.black,
      ),
    );
  }
}
