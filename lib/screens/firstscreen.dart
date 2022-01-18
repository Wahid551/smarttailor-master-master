import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smarttailor/colors/appcolors.dart';
import 'package:smarttailor/screens/welcomescreen.dart';

class SplashScreen extends StatefulWidget {

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
    void initState(){
    super.initState();
    Timer(Duration(seconds: 5), ()=> Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> WelcomeScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              gradient: LinearGradient(
                colors: [
                  Colors.white70,
                  AppColors.backgroundColor,
                ],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              )
            ),
        child: Image.asset("assets/images/log.png", height: 500,),
          )
    );
  }
}

