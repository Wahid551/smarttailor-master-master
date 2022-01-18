import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 30),
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: Colors.white38,
              spreadRadius: 0.1,
              blurRadius: 15,
            )
          ]),
          child: TextFormField(
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
                hoverColor: Colors.black87,
                hintText: "Search",
                hintStyle: TextStyle(color: Colors.black),
                prefixIcon: Icon(Icons.search),
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black87),
                )),
          ),
        ),
      ),
    );
  }
}
