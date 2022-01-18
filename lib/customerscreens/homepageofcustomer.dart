import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:smarttailor/Provider/measurement.dart';
import 'package:smarttailor/Provider/user_provider.dart';
import 'package:smarttailor/colors/appcolors.dart';
import 'package:smarttailor/customerscreens/cart/cartScreen.dart';
import 'package:smarttailor/tailorprofile/homescreen.dart';
import 'package:smarttailor/tailorprofile/logoutscreen.dart';
import 'femalemeasurement.dart';
import 'malemeasurement.dart';

class CustomerHomePage extends StatefulWidget {
  const CustomerHomePage({Key? key}) : super(key: key);

  @override
  _CustomerHomePageState createState() => _CustomerHomePageState();
}

class _CustomerHomePageState extends State<CustomerHomePage> {
  late userData _userData;
  late MaleMeasurementProvider _model;

  @override
  void initState() {
    _userData = Provider.of(context, listen: false);
    _userData.getAllTailors();
    _model = Provider.of(context, listen: false);
    _model.getFeMaleData();
    _model.getMaleData();

    super.initState();
  }

  final screens = [
    HomeScreen(),
    MaleMeasurement(),
    FemaleMeasurement(),
    CartScreen(),
    ProfileScreen(),
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final items = [
      Icon(Icons.home, size: 25),
      Icon(FontAwesomeIcons.male, size: 25),
      Icon(FontAwesomeIcons.female, size: 25),
      Icon(
        Icons.add_shopping_cart,
        size: 25,
      ),
      Icon(Icons.account_circle, size: 25),
    ];
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      extendBody: true,
      body: screens[_currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        color: AppColors.cupCakeColor,
        buttonBackgroundColor: AppColors.linenColor,
        backgroundColor: Colors.transparent,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 300),
        items: items,
        index: _currentIndex,
        height: 55,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
