import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smarttailor/colors/appcolors.dart';

class OrderButton extends StatelessWidget {
  const OrderButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 100),
      width: double.infinity,
      height: 40,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: AppColors.navajoWhiteColor,
          gradient: LinearGradient(
            colors: [
              AppColors.electricBlueColor,
              Colors.white70,
            ]
          ),
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
            "Order",
            style: GoogleFonts.galada(textStyle: TextStyle(color: AppColors.electricBlueColor, fontSize: 25))
        ),
      ),
    );
  }
}
