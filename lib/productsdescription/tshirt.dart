import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smarttailor/buttonwidget/orderbutton.dart';
import 'package:smarttailor/colors/appcolors.dart';
import 'package:smarttailor/customerscreens/measurements.dart';

class TShirtDescription extends StatelessWidget {
  const TShirtDescription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cupCakeColor,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 400,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/img/tshirt.png"),
                  )
              ),
            ),
            SizedBox(height: 25),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 90),
                  child: Text(
                    "Price",
                    style: GoogleFonts.lobster(textStyle: TextStyle(color: Colors.black87, fontSize: 20)),
                  ),
                ),
                SizedBox(width: 50),
                Text(
                  "2000",
                  style: GoogleFonts.knewave(textStyle: TextStyle(color: AppColors.coralColor, fontSize: 25)),
                )
              ],
            ),
            SizedBox(height: 18),
            Text(
              "Yellow Regular Fit Shirt",
              style: GoogleFonts.lemon(textStyle: TextStyle(color: AppColors.electricBlueColor, fontSize: 20)),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                "Elevate your look with this classic design stripe shirt. This men wardrobe staple can be worn in the office or you can also wear it at casual events. Pair this shirt with chinos or jeans for an effortless style.",
              ),
            ),
            SizedBox(height: 40),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> Measurements()));
              },
                child: OrderButton()
            ),
          ],
        ),
      ),
    );
  }
}
