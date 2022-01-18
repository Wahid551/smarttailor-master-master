import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:smarttailor/models/Measurement_Model.dart';

class MaleMeasurementProvider extends ChangeNotifier {
  bool isLoading=false;
  Future<void> updateMaleData(mapData) async {
    isLoading=true;
    notifyListeners();
    await FirebaseFirestore.instance
        .collection("MaleMeasurement")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update(mapData)
        .catchError((e) {
      print(e.toString());
    });
    isLoading=false;
    notifyListeners();
  }




  // Add Female Data
  Future<void> updateFeMaleData(mapData) async {
    isLoading=true;
    notifyListeners();
    await FirebaseFirestore.instance
        .collection("FemaleMeasurement")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update(mapData)
        .catchError((e) {
      print(e.toString());
    });
    isLoading=false;
    notifyListeners();
  }


  late MeasurementModel _measurementModel;

  getMaleData() async {
    MeasurementModel _model;
    DocumentSnapshot data = await FirebaseFirestore.instance
        .collection("MaleMeasurement")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    if (data.exists) {
      _model = MeasurementModel(
          length: data.get("length"),
          upperChest: data.get("upperChest"),
          neck: data.get("neck"),
          shoulder: data.get("shoulder"),
          height: data.get("height"),
          arm: data.get("arm"),
          lowerKWidth: data.get("lowerKWidth"));
      _measurementModel = _model;
      notifyListeners();
    }
  }

  MeasurementModel get currentUserData {
    return _measurementModel;
  }

  // Get Female Data

  late MeasurementModel _meaModel;

  getFeMaleData() async {
    MeasurementModel _model;
    DocumentSnapshot data = await FirebaseFirestore.instance
        .collection("FemaleMeasurement")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    if (data.exists) {
      _model = MeasurementModel(
          length: data.get("length"),
          upperChest: data.get("upperChest"),
          neck: data.get("neck"),
          shoulder: data.get("shoulder"),
          height: data.get("height"),
          arm: data.get("arm"),
          lowerKWidth: data.get("lowerKWidth"));
      _meaModel = _model;
      notifyListeners();
    }
  }

  MeasurementModel get currentFemaleData {
    return _meaModel;
  }
}
