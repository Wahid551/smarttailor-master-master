import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:smarttailor/Provider/customer_data_provider.dart';
import 'package:smarttailor/colors/appcolors.dart';
import 'package:smarttailor/customerscreens/ChatBox/chatBox.dart';
import 'package:smarttailor/customerscreens/orders/orders_list.dart';
import 'package:smarttailor/notifications/notifications.dart';
import 'package:smarttailor/screens/welcomescreen.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String imageUrl = "https://avatars.githubusercontent.com/u/73787635?v=4";
  late CustomerProvider customerProvider;

  @override
  Widget build(BuildContext context) {
    customerProvider = Provider.of(context);
    var data = customerProvider.currentUserDataList;
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            // ignore: deprecated_member_use
            overflow: Overflow.visible,
            alignment: Alignment.center,
            children: [
              Image(
                height: MediaQuery.of(context).size.height / 3,
                fit: BoxFit.cover,
                image: NetworkImage(
                    'https://images.unsplash.com/photo-1441986300917-64674bd600d8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'),
              ),
              Positioned(
                bottom: -50,
                right: 40,
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(data.userImage),
                ),
              )
            ],
          ),
          SizedBox(height: 70),
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(left: 38),
                child: Text("Full Name",
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    )),
              ),
              SizedBox(width: 50),
              Text(
                data.firstName + " " + data.lastName,
                style: TextStyle(color: Colors.black87, fontSize: 15),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Divider(thickness: 1.5, color: Colors.blueGrey),
          ),
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(left: 38),
                child: Text("Email",
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    )),
              ),
              SizedBox(width: 85),
              Text(
                data.userEmail,
                style: TextStyle(color: Colors.black87, fontSize: 15),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Divider(thickness: 1.5, color: Colors.blueGrey),
          ),
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(left: 38),
                child: Text("Phone",
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    )),
              ),
              SizedBox(width: 80),
              Text(
                data.phone,
                style: TextStyle(color: Colors.black87, fontSize: 15),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Divider(thickness: 1.5, color: Colors.blueGrey),
          ),
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(left: 38),
                child: Text("Address",
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    )),
              ),
              SizedBox(width: 70),
              Text(
                data.address,
                style: TextStyle(color: Colors.black87, fontSize: 15),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Divider(thickness: 1.5, color: Colors.blueGrey),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MaterialButton(
                minWidth: 150,
                color: Colors.amber,
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => OrdersList()));
                },
                shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  "My Orders",
                  style: GoogleFonts.knewave(
                    textStyle: TextStyle(color: AppColors.eigengrauColor),
                  ),
                  textScaleFactor: 1.0,
                ),
              ),
              MaterialButton(
                minWidth: 150,
                color: Colors.green,
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Notifications()));
                },
                shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  "Notifications",
                  style: GoogleFonts.knewave(
                    textStyle: TextStyle(color: Colors.white),
                  ),
                  textScaleFactor: 1.0,
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MaterialButton(
                minWidth: 150,
                color: AppColors.eigengrauColor,
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Room()));
                },
                shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  "Chat",
                  style: GoogleFonts.knewave(
                    textStyle: TextStyle(color: Colors.white),
                  ),
                  textScaleFactor: 1.0,
                ),
              ),
              MaterialButton(
                minWidth: 150,
                color: Colors.redAccent,
                onPressed: () async {
                  await FirebaseAuth.instance.signOut().then((value) {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => WelcomeScreen()));
                  });
                },
                shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  "Logout",
                  style: GoogleFonts.knewave(
                    textStyle: TextStyle(color: Colors.white),
                  ),
                  textScaleFactor: 1.0,
                ),
              ),
            ],
          ),
        ],
      )),
    );
  }
}
