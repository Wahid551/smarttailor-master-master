import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:smarttailor/Provider/product_provider.dart';
import 'package:smarttailor/Provider/user_provider.dart';
import 'package:smarttailor/colors/appcolors.dart';
import 'package:smarttailor/notifications/notifications.dart';
import 'package:smarttailor/tailorscreens/drawer.dart';

import 'female_products/babycollection.dart';
import 'female_products/kameezshalwar.dart';
import 'female_products/pants.dart';
import 'female_products/shirt.dart';

class TailorFeMaleSuiting extends StatefulWidget {
  const TailorFeMaleSuiting({Key? key}) : super(key: key);

  @override
  _TailorFeMaleSuitingState createState() => _TailorFeMaleSuitingState();
}

class _TailorFeMaleSuitingState extends State<TailorFeMaleSuiting>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    ProductProvider productProvider = Provider.of(context, listen: false);
    productProvider.getMyProducts();
    super.initState();
    tabController = new TabController(length: 4, vsync: this, initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    userData _userData = Provider.of<userData>(context);
    _userData.getUserData();
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            "Female Designs",
            style: GoogleFonts.knewave(
              textStyle: TextStyle(color: AppColors.eigengrauColor),
            ),
            textScaleFactor: 1.2,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 13),
              child: GestureDetector(
                onTap: () {
                  {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Notifications()));
                  }
                },
                child: CircleAvatar(
                    radius: 18,
                    backgroundColor: AppColors.eigengrauColor,
                    child: Icon(
                      Icons.contact_page_outlined,
                      color: AppColors.coralColor,
                    )),
              ),
            )
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
        drawer: MyDrawer(
          userProvider: _userData,
        ),
        body: TabBarView(controller: tabController, children: [
          KameezShalwar(),
          Shirt(),
          Trouser(),
          BabiesCollection(),
        ]));
  }
}
