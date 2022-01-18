import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smarttailor/colors/appcolors.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 25),
      width: double.infinity,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.eigengrauColor,
        boxShadow: [
          BoxShadow(
            color: AppColors.firstScreenContainerColor,
            spreadRadius: 1,
            offset: Offset(1,0),
            blurRadius: 8
          )
        ]
      ),
      child: Center(
        child: Text(
          "Login",
          style: GoogleFonts.knewave(textStyle: TextStyle(color: AppColors.coralColor, fontSize: 20))
        ),
      ),
    );
  }
}
