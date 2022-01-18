import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smarttailor/colors/appcolors.dart';

class CustomerOrderLists extends StatefulWidget {
  const CustomerOrderLists({Key? key}) : super(key: key);

  @override
  _CustomerOrderListsState createState() => _CustomerOrderListsState();
}

class _CustomerOrderListsState extends State<CustomerOrderLists> {
  String imageUrl = "https://avatars.githubusercontent.com/u/73787635?v=4";
  String imageUrl1 = "https://avatars.githubusercontent.com/u/73393935?v=4";
  String imageUrl2 = "https://avatars.githubusercontent.com/u/73339220?v=4";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: ListView(physics: BouncingScrollPhysics(), children: [
        SizedBox(height: 20),
        Container(
          padding: EdgeInsets.only(left: 70),
          child: Text("Customer Orders",
              textScaleFactor: 1.3,
              style: GoogleFonts.knewave(
                  textStyle: TextStyle(
                    color: AppColors.eigengrauColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  letterSpacing: 1.0)),
        ),
        SizedBox(height: 30),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 14),
          padding: EdgeInsets.only(left: 10),
          width: double.infinity,
          height: 110,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13),
              gradient: LinearGradient(
                colors: [
                  Colors.white,
                  Colors.deepOrange.shade300,
                ],
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  offset: Offset(0.1, 0.1),
                  blurRadius: 15,
                ),
              ]),
          child: Row(
            children: [
              CircleAvatar(
                radius: 45,
                backgroundImage: NetworkImage(imageUrl),
              ),
              SizedBox(width: 50),
              Text(
                "Shakeeb Khan",
                style: TextStyle(
                  color: AppColors.eigengrauColor,
                  fontSize: 17,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 14),
          padding: EdgeInsets.only(left: 10),
          width: double.infinity,
          height: 110,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13),
              gradient: LinearGradient(
                colors: [
                  Colors.deepOrange.shade300,
                  Colors.white,
                ],
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  offset: Offset(0.1, 0.1),
                  blurRadius: 15,
                ),
              ]),
          child: Row(
            children: [
              CircleAvatar(
                radius: 45,
                backgroundImage: NetworkImage(imageUrl),
              ),
              SizedBox(width: 50),
              Text(
                "Wahid Malik",
                style: TextStyle(
                  color: AppColors.eigengrauColor,
                  fontSize: 17,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 14),
          padding: EdgeInsets.only(left: 10),
          width: double.infinity,
          height: 110,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13),
              gradient: LinearGradient(
                colors: [
                  Colors.white,
                  Colors.deepOrange.shade300,
                ],
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  offset: Offset(0.1, 0.1),
                  blurRadius: 15,
                ),
              ]),
          child: Row(
            children: [
              CircleAvatar(
                radius: 45,
                backgroundImage: NetworkImage(imageUrl),
              ),
              SizedBox(width: 50),
              Text(
                "Hamza Zahoor",
                style: TextStyle(
                  color: AppColors.eigengrauColor,
                  fontSize: 17,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 14),
          padding: EdgeInsets.only(left: 10),
          width: double.infinity,
          height: 110,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13),
              gradient: LinearGradient(
                colors: [
                  Colors.deepOrange.shade300,
                  Colors.white,
                ],
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  offset: Offset(0.1, 0.1),
                  blurRadius: 15,
                ),
              ]),
          child: Row(
            children: [
              CircleAvatar(
                radius: 45,
                backgroundImage: NetworkImage(imageUrl),
              ),
              SizedBox(width: 50),
              Text(
                "Ahmer Iqbal",
                style: TextStyle(
                  color: AppColors.eigengrauColor,
                  fontSize: 17,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 14),
          padding: EdgeInsets.only(left: 10),
          width: double.infinity,
          height: 110,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13),
              gradient: LinearGradient(
                colors: [
                  Colors.white,
                  Colors.deepOrange.shade300,
                ],
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  offset: Offset(0.1, 0.1),
                  blurRadius: 15,
                ),
              ]),
          child: Row(
            children: [
              CircleAvatar(
                radius: 45,
                backgroundImage: NetworkImage(imageUrl),
              ),
              SizedBox(width: 50),
              Text(
                "Shaila Khan",
                style: TextStyle(
                  color: AppColors.eigengrauColor,
                  fontSize: 17,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
