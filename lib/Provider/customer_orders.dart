import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:smarttailor/models/cutomer_order_model.dart';

class CustomerOrdersProvider extends ChangeNotifier {
  List<CustomerOrderModel> _customerOrders = [];

  void getCustomerOrders() async {
    CustomerOrderModel _orderModel;
    List<CustomerOrderModel> _newList = [];
    QuerySnapshot data =
        await FirebaseFirestore.instance.collection("CustomerOrders").get();

    data.docs.forEach((element) {
      _orderModel = CustomerOrderModel(
        upperChest: element.get("upperChest"),
        shoulder: element.get("shoulder"),
        neck: element.get("neck"),
        lowerKWidth: element.get("lowerKWidth"),
        height: element.get("height"),
        length: element.get("length"),
        arm: element.get("arm"),
        totalAmount: element.get("TotalAmount"),
        ItemsList: element.get("ItemsList"),
        city: element.get("city"),
        area:  element.get("area"),
        pincode:  element.get("pinCode"),
        society:  element.get("society"),
        street:  element.get("street"),
        customerId: element.get("CustomerId"),
      );
      _newList.add(_orderModel);
      notifyListeners();
    });
    _customerOrders=_newList;
    notifyListeners();
  }


  List<CustomerOrderModel> get getCustomerOrdersList{
    return _customerOrders;
  }
}
