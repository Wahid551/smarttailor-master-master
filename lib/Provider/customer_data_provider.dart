
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:smarttailor/models/User_Data_Model.dart';

class CustomerProvider extends ChangeNotifier{
  late UserModel currentData;

  void getUserData() async {
    UserModel userModel;
    var value = await FirebaseFirestore.instance
        .collection("CustomerUserRecord")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    if (value.exists) {
      userModel = UserModel(
        uid: value.get("userUid"),
        userEmail: value.get("Email"),
        userImage: value.get("userImage"),
        firstName: value.get("FirstName"),
        lastName: value.get('LastName'),
        address: value.get("Address"),
        gender: value.get('Gender'),
        phone: value.get('phone'),
        shopName:"",
      );
      currentData = userModel;
      notifyListeners();
    }
  }

  UserModel get currentUserDataList {
    return currentData;
  }
}