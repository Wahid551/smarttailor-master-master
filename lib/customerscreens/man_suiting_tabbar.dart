import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:smarttailor/Provider/product_provider.dart';
import 'package:smarttailor/colors/appcolors.dart';
import 'package:smarttailor/customerscreens/babycollection.dart';
import 'package:smarttailor/customerscreens/kameezshalwar.dart';
import 'package:smarttailor/customerscreens/pants.dart';
import 'package:smarttailor/customerscreens/shirt.dart';

import 'cart/cartScreen.dart';

// ignore: must_be_immutable
class TailorMaleSuiting extends StatefulWidget {
  String uid;
  TailorMaleSuiting({required this.uid});

  @override
  _TailorMaleSuitingState createState() => _TailorMaleSuitingState();
}

class _TailorMaleSuitingState extends State<TailorMaleSuiting>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    ProductProvider productProvider = Provider.of(context, listen: false);
    productProvider.getProducts(widget.uid);
    super.initState();
    tabController = new TabController(length: 4, vsync: this, initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            "Man Designs",
            style: GoogleFonts.knewave(
              textStyle: TextStyle(color: AppColors.eigengrauColor),
            ),
            textScaleFactor: 1.2,
          ),
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => CartScreen()));
                },
                child: CircleAvatar(
                    child: Icon(
                      Icons.shop,
                      size: 22.0,
                      color: Color(0xFFFF7643),
                    ),
                    radius: 20.0,
                    backgroundColor: Colors.black12),
              ),
            ),
          ],
          bottom: TabBar(
              controller: tabController,
              labelColor: AppColors.eigengrauColor,
              labelStyle: TextStyle(
                  color: AppColors.coralColor,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
              unselectedLabelColor: AppColors.electricBlueColor,
              isScrollable: true,
              indicatorColor: Colors.redAccent,
              tabs: [
                Tab(
                  text: "Kameez/Shalwar",
                ),
                Tab(
                  text: "Shirts",
                ),
                Tab(
                  text: "Pants",
                ),
                Tab(
                  text: "Oher",
                )
              ]),
        ),
        // drawer: MyDrawer(userProvider: _userData,),
        body: TabBarView(controller: tabController, children: [
          KameezShalwar(),
          Shirt(),
          Trouser(),
          BabiesCollection(),
        ]));
  }
}
