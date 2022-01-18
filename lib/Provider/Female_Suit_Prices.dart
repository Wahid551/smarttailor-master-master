

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:smarttailor/models/Price_Model.dart';

class FemalePricesProvider extends ChangeNotifier{


  Future<void> addPrices()async{
    await FirebaseFirestore.instance.collection("FemaleSuitPrices").doc(FirebaseAuth.instance.currentUser!.uid).set(
        {
          "Single":"500",
          "Double":"600",
          "Design":"700",
          "Sarhi":"800",
          "Lehnga":"900",
        }
    ).catchError((e){
      print(e.toString());
    });
  }

  late PriceModel priceData;

  void getPriceData() async {
    PriceModel priceModel;
    var value = await FirebaseFirestore.instance
        .collection("FemaleSuitPrices")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    if (value.exists) {
      priceModel = PriceModel(
        design: value.get("Design"),
        double: value.get("Double"),
        single: value.get("Single"),
        lehnga:value.get("Lehnga"),
        sarhi: value.get("Sarhi"),

      );
      priceData = priceModel;
      notifyListeners();
    }
  }

  PriceModel get currentUserData {
    return priceData;
  }

  Future<void> updateData(mapData,uid)async{
    await FirebaseFirestore.instance.collection('FemaleSuitPrices').doc(uid).update(mapData);
    notifyListeners();
  }

  late PriceModel data;

  Future<void> getTailorPriceData(String uid) async {
    PriceModel priceModel;
    var value = await FirebaseFirestore.instance
        .collection("FemaleSuitPrices")
        .doc(uid)
        .get();
    if (value.exists) {
      priceModel = PriceModel(
        design: value.get("Design"),
        double: value.get("Double"),
        single: value.get("Single"),
        lehnga:value.get("Lehnga"),
        sarhi: value.get("Sarhi"),

      );
      data = priceModel;
      notifyListeners();
    }
  }

  PriceModel get currentTailorDataList {
    return data;
  }


}