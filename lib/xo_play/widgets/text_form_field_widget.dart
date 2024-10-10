import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextFormFieldWidget extends StatelessWidget {
  TextFormFieldWidget(
      {required this.hint,
      required this.validator,
      required this.controller,
      required this.color,
      super.key});

  String hint;
  TextEditingController controller;
  String? Function(String?)? validator;
  Color color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.01),
      child: TextFormField(
        controller: controller,
        validator: validator,
        style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.w500, color: Colors.black),
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.person,
              color: color,
            ),
            hintText: hint,
            hintStyle: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.black)),
      ),
    );
  }
}
