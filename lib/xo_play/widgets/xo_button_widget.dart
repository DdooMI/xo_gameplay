import 'package:flutter/material.dart';

// ignore: must_be_immutable
class XoButtonWidget extends StatelessWidget {
  XoButtonWidget(
      {required this.label,
      required this.onPressed,
      required this.color,
      super.key});
  String label;
  Color color;
  void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: Color.fromARGB(248, 238, 243, 255),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero)),
        child: Text(
          label,
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 40, color: color),
        ));
  }
}
