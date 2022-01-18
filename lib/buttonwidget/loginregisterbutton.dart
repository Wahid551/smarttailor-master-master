import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smarttailor/colors/appcolors.dart';

class TailorRegisterButton extends StatelessWidget {
  const TailorRegisterButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
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
            "Register",
            style: GoogleFonts.lemon(textStyle: TextStyle(color: AppColors.coralColor, fontSize: 18))
        ),
      ),
    );
  }
}
