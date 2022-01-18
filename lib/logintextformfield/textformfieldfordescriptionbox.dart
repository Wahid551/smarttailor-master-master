import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AddressTextFormField extends StatelessWidget {
  late final String hintText;
  bool obscureText = false;
  late final IconData icon;
  late var maxLines;
  TextEditingController address;

  AddressTextFormField(
      {required this.hintText,
      required this.obscureText,
      required this.maxLines,
      required this.address});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 10,
      ),
      child: TextFormField(
        controller: address,
        style: TextStyle(color: Colors.black87),
        maxLines: maxLines,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 50),
          hintStyle: TextStyle(
            color: Colors.black54,
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
