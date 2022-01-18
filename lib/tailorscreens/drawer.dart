import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smarttailor/Provider/user_provider.dart';
import 'package:smarttailor/colors/appcolors.dart';
import 'package:smarttailor/drawerpages/addproducts.dart';
import 'package:smarttailor/drawerpages/customerorderlists.dart';
import 'package:smarttailor/drawerpages/profilepage.dart';
import 'package:smarttailor/screens/welcomescreen.dart';
import 'package:smarttailor/tailorscreens/ChatBox/chatBox.dart';
import 'package:smarttailor/tailorscreens/customer_orders.dart';
import 'female_suiting.dart';
import 'malesuiting.dart';

// ignore: must_be_immutable
class MyDrawer extends StatefulWidget {
  late userData userProvider;
  MyDrawer({required this.userProvider});

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Color(0xffffa500),
                Color(0xffffc87c),
              ]
          ),
        ),
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
              //     gradient: LinearGradient(colors: [
              //   Colors.white,
              //   AppColors.whiteSmokeColor,
              // ])
                gradient: LinearGradient(
                    colors: [
                      Color(0xffffa500),
                      Color(0xffffc87c),
                    ]
                ),
              ),
              accountName: Text(
                widget.userProvider.currentUserData.firstName +
                    " " +
                    widget.userProvider.currentUserData.lastName,
                style: GoogleFonts.titanOne(
                  textStyle:
                      TextStyle(color: AppColors.eigengrauColor, fontSize: 18),
                ),
              ),
              accountEmail: Text(
                widget.userProvider.currentUserData.userEmail,
                style: TextStyle(color: Colors.black87),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundImage:
                    NetworkImage(widget.userProvider.currentUserData.userImage),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TailorProfilePage()));
              },
              child: ListTile(
                selectedTileColor: AppColors.coralColor,
                title: Text(
                  "Profile",
                  style: TextStyle(color: Colors.black87, fontSize: 15),
                ),
                leading: Icon(
                  CupertinoIcons.profile_circled,
                  color: AppColors.eigengrauColor,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) =>TailorAddProduct()));
              },
              child: ListTile(
                selectedTileColor: AppColors.apricotColor,
                selected: true,
                title: Text(
                  "Add Product",
                  style: TextStyle(color: Colors.black87, fontSize: 15),
                ),
                leading: Icon(
                  CupertinoIcons.add_circled,
                  color: AppColors.eigengrauColor,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CustomerOrders()));
              },
              child: ListTile(
                selectedTileColor: AppColors.apricotColor,
                selected: true,
                title: Text(
                  "Customer Orders",
                  style: TextStyle(color: Colors.black87, fontSize: 15),
                ),
                leading: Icon(
                  CupertinoIcons.add_circled,
                  color: AppColors.eigengrauColor,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TailorMaleSuiting()));
              },
              child: ListTile(
                selectedTileColor: AppColors.apricotColor,
                selected: true,
                title: Text(
                  "Male",
                  style: TextStyle(color: Colors.black87, fontSize: 15),
                ),
                leading: Icon(
                  FontAwesomeIcons.male,
                  color: AppColors.eigengrauColor,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TailorFeMaleSuiting()));
              },
              child: ListTile(
                selectedTileColor: AppColors.apricotColor,
                selected: true,
                title: Text(
                  "Female",
                  style: TextStyle(color: Colors.black87, fontSize: 15),
                ),
                leading: Icon(
                  FontAwesomeIcons.female,
                  color: AppColors.eigengrauColor,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Room()));
              },
              child: ListTile(
                selectedTileColor: AppColors.apricotColor,
                selected: true,
                title: Text(
                  "Chat",
                  style: TextStyle(color: Colors.black87, fontSize: 15),
                ),
                leading: Icon(
                  CupertinoIcons.chat_bubble_text_fill,
                  color: AppColors.eigengrauColor,
                ),
              ),
            ),
            // GestureDetector(
            //   onTap: () {
            //     Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //             builder: (context) => CustomerOrderLists()));
            //   },
            //   child: ListTile(
            //     selectedTileColor: AppColors.apricotColor,
            //     selected: true,
            //     title: Text(
            //       "Orders List",
            //       style: TextStyle(color: Colors.black87, fontSize: 15),
            //     ),
            //     leading: Icon(
            //       CupertinoIcons.list_bullet_below_rectangle,
            //       color: AppColors.coralColor,
            //     ),
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Divider(thickness: 2, color: Colors.white),
            ),
            ListTile(
              onTap: () async {
                await FirebaseAuth.instance.signOut().then((value) {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => WelcomeScreen()));
                });
              },
              selectedTileColor: AppColors.apricotColor,
              selected: true,
              title: Text(
                "Logout",
                style: TextStyle(color: Colors.black87, fontSize: 15),
              ),
              leading: Icon(
                Icons.logout_outlined,
                color: AppColors.eigengrauColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
