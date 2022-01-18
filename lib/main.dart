import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smarttailor/Provider/check_out_provider.dart';
import 'package:smarttailor/Provider/customer_orders.dart';
import 'package:smarttailor/Provider/measurement.dart';
import 'package:smarttailor/Provider/order_provider.dart';
import 'package:smarttailor/Provider/review_cart_provider.dart';
import 'package:smarttailor/screens/firstscreen.dart';

import 'Provider/Female_Suit_Prices.dart';
import 'Provider/Man_suit_prises_provider.dart';
import 'Provider/customer_data_provider.dart';
import 'Provider/notification_provider.dart';
import 'Provider/product_provider.dart';
import 'Provider/user_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProductProvider>(
          create: (context) => ProductProvider(),
        ),
        ChangeNotifierProvider<userData>(
          create: (context) => userData(),
        ),
        ChangeNotifierProvider<MenPricesProvider>(
          create: (context) => MenPricesProvider(),
        ),
        ChangeNotifierProvider<FemalePricesProvider>(
          create: (context) => FemalePricesProvider(),
        ),
        ChangeNotifierProvider<ReviewProvider>(
          create: (context) => ReviewProvider(),
        ),
        ChangeNotifierProvider<MaleMeasurementProvider>(
          create: (context) => MaleMeasurementProvider(),
        ),
        ChangeNotifierProvider<CheckoutProvider>(
          create: (context) => CheckoutProvider(),
        ),
        ChangeNotifierProvider<OrdersProvider>(
          create: (context) => OrdersProvider(),
        ),
        ChangeNotifierProvider<CustomerOrdersProvider>(
          create: (context) => CustomerOrdersProvider(),
        ),
        ChangeNotifierProvider<CustomerProvider>(
          create: (context) => CustomerProvider(),
        ),
        ChangeNotifierProvider<Notification_provider>(
          create: (context) => Notification_provider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            appBarTheme: AppBarTheme(
                iconTheme: IconThemeData(
          color: Colors.redAccent,
        ))),
        home: SplashScreen(),
      ),
    );
  }
}
