import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:smarttailor/Provider/Female_Suit_Prices.dart';
import 'package:smarttailor/Provider/Man_suit_prises_provider.dart';
import 'package:smarttailor/Provider/customer_data_provider.dart';
import 'package:smarttailor/Provider/user_provider.dart';
import 'package:smarttailor/colors/appcolors.dart';
import 'package:smarttailor/customerscreens/tailor_profile.dart';
import 'package:smarttailor/models/User_Data_Model.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String imageUrl = "https://avatars.githubusercontent.com/u/73787635?v=4";
  String imageUrl1 = "https://avatars.githubusercontent.com/u/73393935?v=4";
  String imageUrl2 = "https://avatars.githubusercontent.com/u/73339220?v=4";
  String imageUrl3 =
      "https://scontent.flhe25-1.fna.fbcdn.net/v/t1.6435-9/240417501_1280664795688977_6569811042919174013_n.jpg?_nc_cat=108&ccb=1-5&_nc_sid=09cbfe&_nc_eui2=AeFQx8Vv30BpFmAcdn2DB0OBZLzo6Tf79YNkvOjpN_v1g9GHrmp8f_2EfbLNtig-L0p8wAurl0KjJRDOjorp7SSX&_nc_ohc=CptwvX1HbEcAX-jUNLg&_nc_ht=scontent.flhe25-1.fna&oh=a2fadfb25efc89c72306d097a0a236a6&oe=618D2D85";

  late userData _userData;
  late MenPricesProvider _men;
  late FemalePricesProvider _female;
  late CustomerProvider customerProvider;
  @override
  Widget build(BuildContext context) {
    _men = Provider.of(context);
    _female = Provider.of(context);
    customerProvider = Provider.of(context);
    customerProvider.getUserData();
    _userData = Provider.of(context);
    var data = _userData.getTailorsProfile;
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black87,
          ),
          backgroundColor: Color(0xffffa500),
          centerTitle: true,
          title: Column(
            children: [
              Text(
                "Customer Dashboard",
                style: GoogleFonts.knewave(textStyle: TextStyle(color: AppColors.eigengrauColor))
              ),
            ],
          ),
        ),
        backgroundColor: AppColors.cupCakeColor,
        body: _userData.getTailorsProfile.isEmpty
            ? Center(
                child: Container(
                  child: Text("No Data"),
                ),
              )
            : ListView.builder(
                itemCount: data.length,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  UserModel _data = data[index];
                  return Column(
                    children: [
                      SizedBox(height: 20),
                      GestureDetector(
                        onTap: () {
                          _men.getTailorPriceData(_data.uid).then((value) {
                            _female.getTailorPriceData(_data.uid).then((value) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => TailorProfilePage(
                                            data: _data,
                                          )));
                            });
                          });
                        },
                        child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 15),
                            height: 120,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                    Color(0xffffa500),
                                    Color(0xffffc87c),
                                  ]
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(0.1, 0.1),
                                  blurRadius: 10,
                                )
                              ],
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      alignment: Alignment.topLeft,
                                      padding: EdgeInsets.only(
                                          left: 15.0, top: 20.0),
                                      child: Text(
                                        _data.firstName + " " + _data.lastName,
                                        style: GoogleFonts.pattaya(
                                            textStyle: TextStyle(
                                          color: AppColors.eigengrauColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        )),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(top: 15.0),
                                      child: CircleAvatar(
                                        radius: 40,
                                        backgroundImage:
                                            NetworkImage(_data.userImage),
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  alignment: Alignment.topLeft,
                                  padding: EdgeInsets.only(left: 40.0),
                                  child: Text(
                                    _data.gender == 1
                                        ? "Male Tailor"
                                        : "Female Tailor",
                                    style: GoogleFonts.lato(
                                        textStyle: TextStyle(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    )),
                                  ),
                                ),
                              ],
                            )),
                      ),
                    ],
                  );
                },
              ));
  }
}
