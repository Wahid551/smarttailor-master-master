import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smarttailor/Provider/check_out_provider.dart';
import 'package:smarttailor/Provider/customer_data_provider.dart';
import 'package:smarttailor/Provider/measurement.dart';
import 'package:smarttailor/Provider/notification_provider.dart';
import 'package:smarttailor/Provider/review_cart_provider.dart';
import 'package:smarttailor/models/Measurement_Model.dart';
import 'package:smarttailor/models/delivery_address_model.dart';
import 'package:smarttailor/models/review_cart_model.dart';

import '../../../success.dart';

// ignore: must_be_immutable
class PaymentSummary extends StatefulWidget {
  DeliveryAddressMode deliveryAddress;
  String measurement;

  PaymentSummary({required this.deliveryAddress, required this.measurement});

  @override
  _PaymentSummaryState createState() => _PaymentSummaryState();
}

enum AddressTypes {
  cash,
}

class _PaymentSummaryState extends State<PaymentSummary> {
  late MaleMeasurementProvider _MeasurementProvider;
  late MeasurementModel maleModel;
  late MeasurementModel femaleModel;
  var myType = AddressTypes.cash;
  late ReviewProvider _reviewProvider;
  Map<String, dynamic> mapData = Map();
  late CustomerProvider customerProvider;
  late Notification_provider notify;
  void placeOrder() async {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.INFO,
      animType: AnimType.BOTTOMSLIDE,
      title: 'Confirmation',
      desc: 'Are you sure to place order.............',
      btnCancelOnPress: () {
        Navigator.of(context).pop();
      },
      btnOkOnPress: () async {
        await FirebaseFirestore.instance
            .collection("Orders")
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .collection("myOrders")
            .add({
          "ItemsList": _review.map((e) {
            return mapData = {
              "cartId": e.cartId,
              "cartName": e.cartName,
              "cartImage": e.cartImage,
              "cartPrice": e.cartPrice,
              "tailorId": e.tailorId,
              "customerUid": customerProvider.currentUserDataList.uid,
              "customerName": customerProvider.currentUserDataList.firstName +
                  " " +
                  customerProvider.currentUserDataList.lastName,
              "customerAddress": customerProvider.currentUserDataList.address,
              "customerPhone": customerProvider.currentUserDataList.phone,
              "customerImage": customerProvider.currentUserDataList.userImage,
              "customerEmail": customerProvider.currentUserDataList.userEmail,
            };
          }).toList(),
          "ShippingCharges": _reviewProvider.getTotalPrice(),
          "TotalAmount": _reviewProvider.getTotalPrice_shipiing(),
          "CustomerId": FirebaseAuth.instance.currentUser!.uid,
        });

        await FirebaseFirestore.instance.collection("CustomerOrders").add({
          "ItemsList": _review.map((e) {
            return mapData = {
              "cartId": e.cartId,
              "cartName": e.cartName,
              "cartImage": e.cartImage,
              "cartPrice": e.cartPrice,
              "tailorId": e.tailorId,
              "customerUid": customerProvider.currentUserDataList.uid,
              "customerName": customerProvider.currentUserDataList.firstName +
                  " " +
                  customerProvider.currentUserDataList.lastName,
              "customerAddress": customerProvider.currentUserDataList.address,
              "customerPhone": customerProvider.currentUserDataList.phone,
              "customerImage": customerProvider.currentUserDataList.userImage,
              "customerEmail": customerProvider.currentUserDataList.userEmail,
            };
          }).toList(),
          "ShippingCharges": _reviewProvider.getTotalPrice(),
          "TotalAmount": _reviewProvider.getTotalPrice_shipiing(),
          "arm": widget.measurement == "male" ? maleModel.arm : femaleModel.arm,
          "length": widget.measurement == "male"
              ? maleModel.length
              : femaleModel.length,
          "height": widget.measurement == "male"
              ? maleModel.height
              : femaleModel.height,
          "lowerKWidth": widget.measurement == "male"
              ? maleModel.lowerKWidth
              : femaleModel.lowerKWidth,
          "neck":
              widget.measurement == "male" ? maleModel.neck : femaleModel.neck,
          "shoulder": widget.measurement == "male"
              ? maleModel.shoulder
              : femaleModel.shoulder,
          "upperChest": widget.measurement == "male"
              ? maleModel.upperChest
              : femaleModel.upperChest,
          "area": _checkoutProvider.getDeliveryAddressList.area,
          "city": _checkoutProvider.getDeliveryAddressList.city,
          "street": _checkoutProvider.getDeliveryAddressList.street,
          "society": _checkoutProvider.getDeliveryAddressList.society,
          "pinCode": _checkoutProvider.getDeliveryAddressList.pinCode,
          "CustomerId": FirebaseAuth.instance.currentUser!.uid,
        }).then((value) async {
          for (int i = 0; i < _review.length; i++) {
            var id = "";
            Map<String, dynamic> mapData = {
              "msg":
                  "${customerProvider.currentUserDataList.firstName + " " + customerProvider.currentUserDataList.lastName} has Placed an Order",
              "time": DateTime.now(),
            };
            // ignore: unrelated_type_equality_checks
            if (_review[i].tailorId.isNotEmpty && _review[i].tailorId != id) {
              id = _review[i].tailorId;
              notify.addData(_review[i].tailorId, mapData);
            }
          }
          _reviewProvider.deleteCart(FirebaseAuth.instance.currentUser!.uid);
        });
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => Success()));
      },
    )..show();
  }

  late List<ReviewCartModel> _review;
  @override
  void initState() {
    CustomerProvider _customerProvider = Provider.of(context, listen: false);
    _customerProvider.getUserData();

    super.initState();
  }

  late CheckoutProvider _checkoutProvider;
  @override
  Widget build(BuildContext context) {
    // name();
    notify = Provider.of(context);
    _checkoutProvider = Provider.of(context);
    customerProvider = Provider.of(context);
    _checkoutProvider.getDeliveryAddressList;
    _MeasurementProvider = Provider.of(context);
    _MeasurementProvider.getMaleData();
    _MeasurementProvider.getFeMaleData();
    maleModel = _MeasurementProvider.currentUserData;
    femaleModel = _MeasurementProvider.currentFemaleData;
    _reviewProvider = Provider.of(context);
    var data = _reviewProvider.getReviewCartDataList;
    _review = _reviewProvider.getReviewCartDataList;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: Color(0xFFFF7643),
        title: Text('Payment Summary'),
      ),
      bottomNavigationBar: ListTile(
        title: Text('Total Amount'),
        subtitle: Text(
          "Rs ${_reviewProvider.getTotalPrice_shipiing()}",
          style: TextStyle(
            color: Colors.green[900],
            fontWeight: FontWeight.bold,
            fontSize: 17.0,
          ),
        ),
        trailing: Container(
          width: 160.0,
          child: MaterialButton(
            onPressed: () {
              placeOrder();
            },
            child: Text(
              'Place Order',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            color: Color(0xFFFF7643),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 10.0),
        child: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
            return Column(
              children: [
                ListTile(
                  title: Text(
                      "${widget.deliveryAddress.firstName} ${widget.deliveryAddress.lastName}"),
                  subtitle: Text(
                      "Area ${widget.deliveryAddress.area}, ${widget.deliveryAddress.city}, Street ${widget.deliveryAddress.street}, Society ${widget.deliveryAddress.society}, Pincode ${widget.deliveryAddress.pinCode} "),
                ),
                Divider(),
                ExpansionTile(
                  children: [
                    ListView.builder(
                        itemCount: data.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          ReviewCartModel model = data[index];
                          return ListTile(
                            leading: Image.network(
                              model.cartImage,
                              width: 60.0,
                            ),
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  model.cartName,
                                  style: TextStyle(
                                      color: Colors.grey[600],
                                      fontWeight: FontWeight.bold),
                                ),
                                Text('\Rs ${model.cartPrice}'),
                              ],
                            ),
                            subtitle: Text(""),
                          );
                        }),
                  ],
                  title: Text('Order Items ${data.length}'),
                ),
                Divider(),
                ListTile(
                  minVerticalPadding: 5.0,
                  leading: Text(
                    'Sub Total',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  trailing: Text(
                    "Rs " + _reviewProvider.getTotalPrice().toString(),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                ListTile(
                  minVerticalPadding: 5.0,
                  leading: Text(
                    'Shipping Charge',
                    style: TextStyle(
                      color: Colors.grey[600],
                    ),
                  ),
                  trailing: Text(
                    'Rs 200',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                ListTile(
                  minVerticalPadding: 5.0,
                  leading: Text(
                    'Coupon Discount',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  trailing: Text(
                    'Rs 0',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Divider(),
                ListTile(
                  leading: Text(
                    'Payment Options',
                  ),
                ),
                RadioListTile(
                  value: AddressTypes.cash,
                  groupValue: myType,
                  title: Text("Cash on Delivery"),
                  onChanged: (AddressTypes? value) {
                    setState(() {
                      myType = value!;
                    });
                  },
                  secondary: Icon(
                    Icons.book_online,
                    color: Color(0xFFFF7643),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
