import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smarttailor/Provider/check_out_provider.dart';
import 'package:smarttailor/customerscreens/cart/add_delivery-address/add_delivery_Address.dart';
import 'package:smarttailor/customerscreens/cart/components/payment_summary/payment_summary.dart';
import 'package:smarttailor/customerscreens/cart/components/single_delivery_item.dart';

// ignore: must_be_immutable
class DeliveryDetails extends StatefulWidget {
  String measurement;

  DeliveryDetails({required this.measurement});

  @override
  _DeliveryDetailsState createState() => _DeliveryDetailsState();
}

class _DeliveryDetailsState extends State<DeliveryDetails> {
  @override
  Widget build(BuildContext context) {
    CheckoutProvider deliveryAddressProvider = Provider.of(context);
    deliveryAddressProvider.getDeliveryAddressData();
    var data = deliveryAddressProvider.getDeliveryAddressList;
    return Scaffold(
      appBar: AppBar(
        elevation: 8.0,
        backgroundColor: Colors.white,
        title: Text(
          "Delivery Details",
          style: TextStyle(
            color: Color(0xFFFF7643),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFFFF7643),
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AddDeliverAddress(),
            ),
          );
        },
      ),
      bottomNavigationBar: Container(
        // width: 160,
        height: 48,
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: MaterialButton(
          // ignore: unnecessary_null_comparison
          child: deliveryAddressProvider.getDeliveryAddressList == null
              ? Text(
                  "Add new Address",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                )
              : Text(
                  "Payment Summary",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
          onPressed: () {
            // ignore: unnecessary_null_comparison
            deliveryAddressProvider.getDeliveryAddressList == null
                ? Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => AddDeliverAddress(),
                    ),
                  )
                : Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => PaymentSummary(
                        deliveryAddress:
                            deliveryAddressProvider.getDeliveryAddressList,
                        measurement: widget.measurement,
                      ),
                    ),
                  );
          },
          color: Color(0xFFFF7643),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              30,
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text("Deliver To"),
            leading: Image.asset(
              "assets/images/location.png",
              height: 30,
            ),
          ),
          Divider(
            height: 1,
          ),
          // ignore: unnecessary_null_comparison
          deliveryAddressProvider.getDeliveryAddressList == null
              ? Container(
                  child: Center(
                    child: Text("No Data"),
                  ),
                )
              : Column(children: [
                  SingleDeliveryItem(
                    address:
                        "Area, ${data.area}, Street,${data.street}, Society ${data.society}, Pincode ${data.pinCode}",
                    title: "${data.firstName} ${data.lastName}",
                    number: "${data.mobileNo}",
                    addressType: data.addressType == "AddressType.other"
                        ? "Other"
                        : data.addressType == "AddressType.Home"
                            ? "Home"
                            : "Work",
                  ),
                ]

                  // children: [
                  //   deliveryAddressProvider.getDeliveryAddressList.isEmpty
                  //       ? Container(
                  //     child:Center(child: Text("No Data"),),
                  //   )
                  //       : SingleDeliveryItem(
                  //           address:
                  //               "aera, balochistan/pakistan, Dara Bugti, street, 20, society 07, pincode 8000",
                  //           title: "Assar Developer",
                  //           number: "+923352062349",
                  //           addressType: "Home",
                  //         ),
                  // ],
                  )
        ],
      ),
    );
  }
}
