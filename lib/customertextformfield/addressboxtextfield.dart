import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomerAddressTextField extends StatelessWidget {
  late final String hintText;
  bool obscureText = false;
  late final IconData icon;
  late final Color iconcolor;
  late var maxLines;
  CustomerAddressTextField(
      {required this.hintText,
      required this.obscureText,
      required this.icon,
      required this.iconcolor,
      required this.maxLines});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 10,
      ),
      child: TextFormField(
        style: TextStyle(color: Colors.black87),
        obscureText: obscureText,
        maxLines: maxLines,
        decoration: InputDecoration(
          hintStyle: TextStyle(
            color: Colors.black87,
          ),
          // fillColor: Colors.grey[100],
          // filled: true,
          hintText: hintText,
          border: UnderlineInputBorder(),
        ),
      ),
    );
  }
}
