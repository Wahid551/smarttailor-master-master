import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:smarttailor/Provider/Female_Suit_Prices.dart';
import 'package:smarttailor/Provider/Man_suit_prises_provider.dart';
import 'package:smarttailor/Provider/product_provider.dart';
import 'package:smarttailor/colors/appcolors.dart';
import 'package:smarttailor/customerscreens/female_collection/female_suiting_tabbar.dart';
import 'package:smarttailor/customerscreens/man_suiting_tabbar.dart';
import 'package:smarttailor/models/User_Data_Model.dart';

// ignore: must_be_immutable
class TailorProfilePage extends StatefulWidget {
  UserModel data;
  TailorProfilePage({required this.data});
  @override
  _TailorProfilePageState createState() => _TailorProfilePageState();
}

class _TailorProfilePageState extends State<TailorProfilePage> {
  String imageUrl =
      "https://images.unsplash.com/photo-1497997092403-f091fcf5b6c4?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8dGFpbG9yfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&w=1000&q=80";
  String imageUrl1 = "https://avatars.githubusercontent.com/u/73787635?v=4";
  String imageUrl2 =
      "https://cdn.shopify.com/s/files/1/0578/6429/0456/files/maxresdefault_2_600x600.jpg?v=1626094159";
  String imageUrl3 =
      "https://image.shutterstock.com/image-photo/unstitched-best-fabric-mens-shalwar-260nw-1821186449.jpg";

  late MenPricesProvider _men;
  late FemalePricesProvider _female;

  late ProductProvider _productProvider;
  @override
  Widget build(BuildContext context) {
    _productProvider = Provider.of(context);
    _productProvider.getProducts(widget.data.uid);
    _men = Provider.of(context);
    _men.currentTailorDataList;
    _female = Provider.of(context);
    _female.currentTailorDataList;
    // _userData.getUserData();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          "Profile",
          style: GoogleFonts.knewave(
              textStyle: TextStyle(
            color: AppColors.eigengrauColor,
            fontSize: 24,
          )),
        ),
        // actions: [
        //   Padding(
        //     padding: const EdgeInsets.only(right: 9.0),
        //     child: CircleAvatar(
        //       radius: 17,
        //       backgroundColor: AppColors.coralColor,
        //       child: Icon(
        //         Icons.notifications_active,
        //         color: Colors.black87,
        //       ),
        //     ),
        //   )
        // ],
      ),
      body: SafeArea(
          child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Image.network(
                imageUrl,
                height: MediaQuery.of(context).size.height / 3,
                fit: BoxFit.cover,
              ),
              Positioned(
                bottom: -45,
                left: 220,
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                    widget.data.userImage,
                  ),
                ),
              ),
              Positioned(
                bottom: -80,
                left: 220,
                child: Text(
                  widget.data.firstName + " " + widget.data.lastName,
                  style: GoogleFonts.pattaya(
                      textStyle: TextStyle(
                          color: AppColors.eigengrauColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                ),
              )
            ],
          ),
          SizedBox(
            height: 45,
          ),
          Container(
            margin: EdgeInsets.only(right: 239),
            height: 33,
            width: 120,
            decoration: BoxDecoration(
              color: AppColors.coralColor,
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(30)),
            ),
          ),
          SizedBox(height: 40),
          ListTile(
            leading: Icon(
              Icons.phone,
              size: 25,
              color: AppColors.coralColor,
            ),
            title: Text(
              widget.data.phone,
              style: GoogleFonts.lato(
                textStyle: TextStyle(
                    color: AppColors.eigengrauColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 18),
              child: Divider(
                thickness: 1,
                color: Colors.blueGrey,
              )),
          ListTile(
            leading: Icon(
              Icons.location_on,
              size: 25,
              color: AppColors.coralColor,
            ),
            title: Text(
              widget.data.address,
              style: GoogleFonts.lato(
                textStyle: TextStyle(
                    color: AppColors.eigengrauColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 18),
              child: Divider(
                thickness: 1,
                color: Colors.blueGrey,
              )),
          SizedBox(height: 30),
          Container(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(
              "Check Collection",
              style: GoogleFonts.pollerOne(
                  textStyle: TextStyle(
                color: AppColors.eigengrauColor,
                fontSize: 16,
              )),
            ),
          ),
          SizedBox(
            height: 35.0,
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TailorMaleSuiting(
                                uid: widget.data.uid,
                              )));
                },
                child: Container(
                  margin: EdgeInsets.only(left: 14.0),
                  width: 130,
                  height: 45,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(20),
                          topLeft: Radius.circular(20)),
                      gradient: LinearGradient(colors: [
                        Colors.black87,
                        AppColors.eigengrauColor,
                      ]),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black38,
                          offset: Offset(0.1, 0),
                          blurRadius: 10,
                        )
                      ]),
                  child: ListTile(
                    title: Text(
                      "Male",
                      style: TextStyle(
                          color: AppColors.apricotColor,
                          fontSize: 15,
                          fontWeight: FontWeight.w800),
                    ),
                    trailing: Icon(
                      CupertinoIcons.arrow_right_circle,
                      color: AppColors.apricotColor,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 30,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TailorFeMaleSuiting(
                                uid: widget.data.uid,
                              )));
                },
                child: Container(
                  margin: EdgeInsets.only(left: 14.0),
                  width: 130,
                  height: 45,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(20),
                          topLeft: Radius.circular(20)),
                      gradient: LinearGradient(colors: [
                        Colors.black87,
                        AppColors.eigengrauColor,
                      ]),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black38,
                          offset: Offset(0.1, 0),
                          blurRadius: 10,
                        )
                      ]),
                  child: ListTile(
                    title: Text(
                      "Female",
                      style: TextStyle(
                          color: AppColors.apricotColor,
                          fontSize: 15,
                          fontWeight: FontWeight.w800),
                    ),
                    trailing: Icon(
                      CupertinoIcons.arrow_right_circle,
                      color: AppColors.apricotColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 70),
          Container(
            margin: EdgeInsets.only(left: 8.0),
            child: Text(
              "Male Suit Prices",
              style: GoogleFonts.pollerOne(
                  textStyle: TextStyle(
                color: AppColors.eigengrauColor,
                fontSize: 17,
              )),
            ),
          ),
          SizedBox(height: 26),
          Padding(
            padding: EdgeInsets.only(left: 70.0),
            child: ListTile(
              leading: Text(
                "Single",
                style: TextStyle(
                    color: Colors.black87,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              title: Padding(
                padding: EdgeInsets.only(left: 55.0),
                child: Text(
                  _men.currentTailorDataList.single,
                  style: TextStyle(
                    color: AppColors.coralColor,
                    fontSize: 28,
                  ),
                ),
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 18),
              child: Divider(
                thickness: 1,
                color: Colors.blueGrey,
              )),
          Padding(
            padding: EdgeInsets.only(left: 70.0),
            child: ListTile(
              leading: Text(
                "Double",
                style: TextStyle(
                    color: Colors.black87,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              title: Padding(
                padding: EdgeInsets.only(left: 55.0),
                child: Text(
                  _men.currentTailorDataList.double,
                  style: TextStyle(
                    color: AppColors.coralColor,
                    fontSize: 28,
                  ),
                ),
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 18),
              child: Divider(
                thickness: 1,
                color: Colors.blueGrey,
              )),
          Padding(
            padding: EdgeInsets.only(left: 70.0),
            child: ListTile(
              leading: Text(
                "Design",
                style: TextStyle(
                    color: Colors.black87,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              title: Padding(
                padding: EdgeInsets.only(left: 55.0),
                child: Text(
                  _men.currentTailorDataList.double,
                  style: TextStyle(
                    color: AppColors.coralColor,
                    fontSize: 28,
                  ),
                ),
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 18),
              child: Divider(
                thickness: 1,
                color: Colors.blueGrey,
              )),
          SizedBox(height: 40),
          Container(
            margin: EdgeInsets.only(left: 8.0),
            child: Text(
              "Female Suit Prices",
              style: GoogleFonts.pollerOne(
                  textStyle: TextStyle(
                color: AppColors.eigengrauColor,
                fontSize: 17,
              )),
            ),
          ),
          SizedBox(height: 26),
          Padding(
            padding: EdgeInsets.only(left: 70.0),
            child: ListTile(
              leading: Text(
                "Signle",
                style: TextStyle(
                    color: Colors.black87,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              title: Padding(
                padding: EdgeInsets.only(left: 55.0),
                child: Text(
                  _female.currentTailorDataList.single,
                  style: TextStyle(
                    color: AppColors.coralColor,
                    fontSize: 28,
                  ),
                ),
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 18),
              child: Divider(
                thickness: 1,
                color: Colors.blueGrey,
              )),
          Padding(
            padding: EdgeInsets.only(left: 70.0),
            child: ListTile(
              leading: Text(
                "Double",
                style: TextStyle(
                    color: Colors.black87,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              title: Padding(
                padding: EdgeInsets.only(left: 50.0),
                child: Text(
                  _female.currentTailorDataList.double,
                  style: TextStyle(
                    color: AppColors.coralColor,
                    fontSize: 28,
                  ),
                ),
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 18),
              child: Divider(
                thickness: 1,
                color: Colors.blueGrey,
              )),
          Padding(
            padding: EdgeInsets.only(left: 70.0),
            child: ListTile(
              leading: Text(
                "Design",
                style: TextStyle(
                    color: Colors.black87,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              title: Padding(
                padding: EdgeInsets.only(left: 50.0),
                child: Text(
                  _female.currentTailorDataList.design,
                  style: TextStyle(
                    color: AppColors.coralColor,
                    fontSize: 28,
                  ),
                ),
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 18),
              child: Divider(
                thickness: 1,
                color: Colors.blueGrey,
              )),
          Padding(
            padding: EdgeInsets.only(left: 70.0),
            child: ListTile(
              leading: Text(
                "Sarhi",
                style: TextStyle(
                    color: Colors.black87,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              title: Padding(
                padding: EdgeInsets.only(left: 60.0),
                child: Text(
                  _female.currentTailorDataList.sarhi,
                  style: TextStyle(
                    color: AppColors.coralColor,
                    fontSize: 28,
                  ),
                ),
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 18),
              child: Divider(
                thickness: 1,
                color: Colors.blueGrey,
              )),
          Padding(
            padding: EdgeInsets.only(left: 70.0),
            child: ListTile(
              leading: Text(
                "Lehnga",
                style: TextStyle(
                    color: Colors.black87,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              title: Padding(
                padding: EdgeInsets.only(left: 45.0),
                child: Text(
                  _female.currentTailorDataList.lehnga,
                  style: TextStyle(
                    color: AppColors.coralColor,
                    fontSize: 28,
                  ),
                ),
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 18),
              child: Divider(
                thickness: 1,
                color: Colors.blueGrey,
              )),
          SizedBox(height: 20),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 10),
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                  imageUrl3,
                ))),
              ),
              Container(
                margin: EdgeInsets.only(left: 10),
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                  imageUrl2,
                ))),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(
              "Description",
              style: GoogleFonts.pollerOne(
                  textStyle: TextStyle(
                color: AppColors.eigengrauColor,
                fontSize: 16,
              )),
            ),
          ),
          SizedBox(height: 10.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              "A person whose occupation is making fitted clothes such as suits, trousers, and jackets to fit individual customers.",
            ),
          ),
          SizedBox(height: 30.0),
        ],
      )),
    );
  }
}
