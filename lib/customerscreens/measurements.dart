import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smarttailor/colors/appcolors.dart';
import 'package:smarttailor/customerscreens/femalemeasurement.dart';
import 'package:smarttailor/customerscreens/malemeasurement.dart';

class Measurements extends StatefulWidget {
  const Measurements({Key? key}) : super(key: key);

  @override
  _MeasurementsState createState() => _MeasurementsState();
}

class _MeasurementsState extends State<Measurements> with SingleTickerProviderStateMixin{


  late TabController tabController;

  @override
  void initState(){
    super.initState();
    tabController = new TabController(length: 2, vsync: this, initialIndex: 1);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        centerTitle: true,
        title: Text(
            "Dress Measurements",
          style: GoogleFonts.knewave(textStyle: TextStyle(color: AppColors.coralColor)),
        ),
        elevation: 0.7,
        bottom: TabBar(
          unselectedLabelColor: AppColors.coralColor,
          labelColor: Colors.black,
          controller: tabController,
          indicatorColor: AppColors.coralColor,
          tabs: [
            Tab(
              text: "Male",
              icon: Icon(Icons.male_rounded),
            ),
            Tab(
              text: "Female", icon: Icon(Icons.female),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
          children: [
            MaleMeasurement(),
            FemaleMeasurement(),
          ]
      ),
    );
  }
}
