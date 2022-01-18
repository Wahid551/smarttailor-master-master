import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smarttailor/colors/appcolors.dart';
import 'package:smarttailor/customerscreens/loginpage.dart';
import 'package:smarttailor/tailorscreens/loginpage.dart';


class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
          child: ListView(
            children: [
              SizedBox(height: 25),
              Center(
                child: Text(
                  "Smart Tailor App",
                  style: GoogleFonts.knewave(textStyle: TextStyle(color: AppColors.eigengrauColor, fontSize: 22), letterSpacing: 1.0),
                  // style: TextStyle(
                  //   color: AppColors.welcomeScreenTextColor,
                  //   fontWeight: FontWeight.bold,
                  // ),
                  textScaleFactor: 1.5,
                ),
              ),
              SizedBox(height: 40),
              Center(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  height: 350,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/tail.png"),
                    ),
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(500), bottomRight: Radius.circular(700))
                  ),
                ),
              ),
              SizedBox(height: 30),
              Center(
                child: Text(
                  "Select User Type",
                style: GoogleFonts.lemon(textStyle: TextStyle(color: Colors.black87)),
                  textScaleFactor: 1.3,
                ),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginPages()));
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 65),
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black87
                  ),
                  child: ListTile(
                    title: Text(
                        "Tailor",
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
                      textScaleFactor: 1.0,
                    ),
                    leading: Icon(Icons.cut_rounded,color: Colors.white,),
                  ),
                ),
              ),
              SizedBox(height: 10),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 65),
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black87
                  ),
                  child: ListTile(
                    title: Text(
                      "Customer",
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
                      textScaleFactor: 1.0,
                    ),
                    leading: Icon(Icons.face,color: Colors.white,),
                  ),
                ),
              ),
            ],
          )
      ),
    );
  }
}
