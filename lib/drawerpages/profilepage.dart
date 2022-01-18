import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:smarttailor/Provider/Female_Suit_Prices.dart';
import 'package:smarttailor/Provider/Man_suit_prises_provider.dart';
import 'package:smarttailor/Provider/user_provider.dart';
import 'package:smarttailor/colors/appcolors.dart';
import 'package:smarttailor/tailorscreens/female_suiting.dart';
import 'package:smarttailor/tailorscreens/malesuiting.dart';

// ignore: must_be_immutable
class TailorProfilePage extends StatefulWidget {
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

  updateData() async {
    Map<String, dynamic> _mapData = {
      "userUid": _userData.currentUserData.uid,
      "Email": _userData.currentUserData.userEmail,
      "userImage": _userData.currentUserData.userImage,
      "FirstName": _userData.currentUserData.firstName,
      'LastName': _userData.currentUserData.lastName,
      "Address": address,
      'Gender': _userData.currentUserData.gender,
      'phone': phone,
    };
    await _userData
        .updateData(_mapData, _userData.currentUserData.uid)
        .then((value) {
      print("Data updated");
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => TailorProfilePage()));
    });
  }

  updateMenPrice() async {
    Map<String, dynamic> _mapData = {
      "Single": menSingle,
      "Double": menDouble,
      "Design": menDesign,
    };
    await _men
        .updateData(_mapData, FirebaseAuth.instance.currentUser!.uid)
        .then((value) {
      print("Data updated");
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => TailorProfilePage()));
    });
  }

  updateFemalePrice() async {
    Map<String, dynamic> _mapData = {
      "Single": feSingle,
      "Double": feDouble,
      "Design": feDesign,
      "Sarhi": feSarhi,
      "Lehnga": feLehnga,
    };
    await _female
        .updateData(_mapData, FirebaseAuth.instance.currentUser!.uid)
        .then((value) {
      print("Data updated");
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => TailorProfilePage()));
    });
  }

  var _femaleData;
  var _menData;
  // ignore: unused_field
  var _value = 0;
  late var phone = _userData.currentUserData.phone;
  late var address = _userData.currentUserData.address;
  late userData _userData;
  late MenPricesProvider _men;
  late FemalePricesProvider _female;
  late String menSingle = _menData.single,
      menDouble = _menData.double,
      menDesign = _menData.design;
  late String feSingle = _femaleData.single,
      feDouble = _femaleData.double,
      feDesign = _femaleData.design,
      feSarhi = _femaleData.sarhi,
      feLehnga = _femaleData.lehnga;

  void dialogBox(String val) {
    AwesomeDialog(
      context: context,
      animType: AnimType.SCALE,
      dialogType: DialogType.INFO,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            val == "phone" ? 'Edit Phone Number' : "Edit Address",
            style: TextStyle(fontSize: 22.0),
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextFormField(
                    initialValue: val == "phone" ? phone : address,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20.0),
                    maxLines: 3,
                    onChanged: (val) {
                      setState(() {
                        val == "phone" ? phone = val : address = val;
                      });
                    },
                  ),
                  MaterialButton(
                    onPressed: () {
                      updateData();
                    },
                    shape: StadiumBorder(),
                    color: Colors.green,
                    child: Text("OK"),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      title: 'This is Ignored',
      desc: 'This is also Ignored',
    )..show();
  }

  void showMenBox(String value) {
    AwesomeDialog(
      context: context,
      animType: AnimType.SCALE,
      dialogType: DialogType.INFO,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Enter Price",
            style: TextStyle(fontSize: 22.0),
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextFormField(
                    initialValue: value == "single"
                        ? menSingle
                        : value == "double"
                            ? menDouble
                            : menDesign,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20.0),
                    // maxLines: 3,
                    onChanged: (val) {
                      setState(() {
                        value == "single"
                            ? menSingle = val
                            : value == "double"
                                ? menDouble = val
                                : menDesign = val;
                      });
                    },
                  ),
                  MaterialButton(
                    onPressed: () {
                      updateMenPrice();
                    },
                    shape: StadiumBorder(),
                    color: Colors.green,
                    child: Text("OK"),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      title: 'This is Ignored',
      desc: 'This is also Ignored',
    )..show();
  }

  void showFemaleBox(String value) {
    AwesomeDialog(
      context: context,
      animType: AnimType.SCALE,
      dialogType: DialogType.INFO,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Enter Price",
            style: TextStyle(fontSize: 22.0),
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextFormField(
                    initialValue: value == "single"
                        ? feSingle
                        : value == "double"
                            ? feDouble
                            : value == "design"
                                ? feDesign
                                : value == "sarhi"
                                    ? feSarhi
                                    : feLehnga,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20.0),
                    // maxLines: 3,
                    onChanged: (val) {
                      setState(() {
                        value == "single"
                            ? feSingle = val
                            : value == "double"
                                ? feDouble = val
                                : value == "design"
                                    ? feDesign = val
                                    : value == "sarhi"
                                        ? feSarhi = val
                                        : feLehnga = val;
                      });
                    },
                  ),
                  MaterialButton(
                    onPressed: () {
                      updateFemalePrice();
                    },
                    shape: StadiumBorder(),
                    color: Colors.green,
                    child: Text("OK"),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      title: 'This is Ignored',
      desc: 'This is also Ignored',
    )..show();
  }

  @override
  Widget build(BuildContext context) {
    _userData = Provider.of<userData>(context);
    _men = Provider.of(context);
    _menData = _men.currentUserData;
    _female = Provider.of(context);
    _femaleData = _female.currentUserData;
    // _userData.getUserData();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            "Profile",
            style: GoogleFonts.knewave(
                textStyle: TextStyle(
              color: AppColors.eigengrauColor,
              fontSize: 24,
            )),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 9.0),
            child: CircleAvatar(
              radius: 17,
              backgroundColor: AppColors.coralColor,
              child: Icon(
                Icons.notifications_active,
                color: Colors.black87,
              ),
            ),
          )
        ],
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
                    _userData.currentUserData.userImage,
                  ),
                ),
              ),
              Positioned(
                bottom: -80,
                left: 220,
                child: Text(
                  _userData.currentUserData.firstName +
                      " " +
                      _userData.currentUserData.lastName,
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
              _userData.currentUserData.phone,
              style: GoogleFonts.lato(
                textStyle: TextStyle(
                    color: AppColors.eigengrauColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            trailing: MaterialButton(
              onPressed: () {
                dialogBox("phone");
              },
              color: AppColors.coralColor,
              child: Text("Edit"),
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
              _userData.currentUserData.address,
              style: GoogleFonts.lato(
                textStyle: TextStyle(
                    color: AppColors.eigengrauColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            trailing: MaterialButton(
              onPressed: () {
                dialogBox("address");
              },
              color: AppColors.coralColor,
              child: Text("Edit"),
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
              "Choose One Category",
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
                          builder: (context) => TailorMaleSuiting()));
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
                          builder: (context) => TailorFeMaleSuiting()));
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
          ListTile(
            leading: Text(
              "Single",
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            title: Padding(
              padding: EdgeInsets.only(left: 25.0),
              child: Text(
                _menData.single,
                style: TextStyle(
                  color: AppColors.coralColor,
                  fontSize: 28,
                ),
              ),
            ),
            trailing: MaterialButton(
              onPressed: () {
                showMenBox("single");
              },
              color: AppColors.coralColor,
              child: Text("Edit"),
            ),
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 18),
              child: Divider(
                thickness: 1,
                color: Colors.blueGrey,
              )),
          ListTile(
            leading: Text(
              "Double",
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            title: Padding(
              padding: EdgeInsets.only(left: 25.0),
              child: Text(
                _menData.double,
                style: TextStyle(
                  color: AppColors.coralColor,
                  fontSize: 28,
                ),
              ),
            ),
            trailing: MaterialButton(
              onPressed: () {
                showMenBox("double");
              },
              color: AppColors.coralColor,
              child: Text("Edit"),
            ),
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 18),
              child: Divider(
                thickness: 1,
                color: Colors.blueGrey,
              )),
          ListTile(
            leading: Text(
              "Design",
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            title: Padding(
              padding: EdgeInsets.only(left: 25.0),
              child: Text(
                _menData.design,
                style: TextStyle(
                  color: AppColors.coralColor,
                  fontSize: 28,
                ),
              ),
            ),
            trailing: MaterialButton(
              onPressed: () {
                showMenBox("design");
              },
              color: AppColors.coralColor,
              child: Text("Edit"),
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
          ListTile(
            leading: Text(
              "Signle",
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            title: Padding(
              padding: EdgeInsets.only(left: 25.0),
              child: Text(
                _femaleData.single,
                style: TextStyle(
                  color: AppColors.coralColor,
                  fontSize: 28,
                ),
              ),
            ),
            trailing: MaterialButton(
              onPressed: () {
                showFemaleBox("single");
              },
              color: AppColors.coralColor,
              child: Text("Edit"),
            ),
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 18),
              child: Divider(
                thickness: 1,
                color: Colors.blueGrey,
              )),
          ListTile(
            leading: Text(
              "Double",
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            title: Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Text(
                _femaleData.double,
                style: TextStyle(
                  color: AppColors.coralColor,
                  fontSize: 28,
                ),
              ),
            ),
            trailing: MaterialButton(
              onPressed: () {
                showFemaleBox("double");
              },
              color: AppColors.coralColor,
              child: Text("Edit"),
            ),
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 18),
              child: Divider(
                thickness: 1,
                color: Colors.blueGrey,
              )),
          ListTile(
            leading: Text(
              "Design",
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            title: Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Text(
                _femaleData.design,
                style: TextStyle(
                  color: AppColors.coralColor,
                  fontSize: 28,
                ),
              ),
            ),
            trailing: MaterialButton(
              onPressed: () {
                showFemaleBox("design");
              },
              color: AppColors.coralColor,
              child: Text("Edit"),
            ),
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 18),
              child: Divider(
                thickness: 1,
                color: Colors.blueGrey,
              )),
          ListTile(
            leading: Text(
              "Sarhi",
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            title: Padding(
              padding: EdgeInsets.only(left: 30.0),
              child: Text(
                _femaleData.sarhi,
                style: TextStyle(
                  color: AppColors.coralColor,
                  fontSize: 28,
                ),
              ),
            ),
            trailing: MaterialButton(
              onPressed: () {
                showFemaleBox("sarhi");
              },
              color: AppColors.coralColor,
              child: Text("Edit"),
            ),
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 18),
              child: Divider(
                thickness: 1,
                color: Colors.blueGrey,
              )),
          ListTile(
            leading: Text(
              "Lehnga",
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            title: Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Text(
                _femaleData.lehnga,
                style: TextStyle(
                  color: AppColors.coralColor,
                  fontSize: 28,
                ),
              ),
            ),
            trailing: MaterialButton(
              onPressed: () {
                showFemaleBox("lehnga");
              },
              color: AppColors.coralColor,
              child: Text("Edit"),
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
