import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:smarttailor/Provider/chat.dart';
import 'package:smarttailor/Provider/notification_provider.dart';
import 'package:smarttailor/Provider/user_provider.dart';
import 'package:smarttailor/models/cutomer_order_model.dart';

// ignore: must_be_immutable
class DetailPageofCustomerOrder extends StatefulWidget {
  String customerName;
  String customerPhone;
  String customerImage;
  String customerEmail;
  String customerAddress;
  String city, area, street, pincode, society;
  CustomerOrderModel order;

  DetailPageofCustomerOrder(
      {required this.order,
      required this.city,
      required this.area,
      required this.street,
      required this.pincode,
      required this.society,
      required this.customerEmail,
      required this.customerName,
      required this.customerPhone,
      required this.customerAddress,
      required this.customerImage});

  @override
  _DetailPageofCustomerOrderState createState() =>
      _DetailPageofCustomerOrderState();
}

class _DetailPageofCustomerOrderState extends State<DetailPageofCustomerOrder> {
  late userData _data;
  late Notification_provider notify;

  @override
  void initState() {
    userData data = Provider.of(context, listen: false);
    data.getUserData();
    calculatePrice();
    super.initState();
  }

  num a = 0;
  bool isLoading = false;
  calculatePrice() {
    for (int i = 0; i < widget.order.ItemsList.length; i++) {
      if (widget.order.ItemsList[i]["tailorId"] ==
          FirebaseAuth.instance.currentUser!.uid) {
        a = a + widget.order.ItemsList[i]["cartPrice"];
      }
    }
  }

  getChatRoomId(String a, String b) {
    if (a.substring(0, 1).codeUnitAt(0) > b.substring(0, 1).codeUnitAt(0)) {
      return "$b\_$a";
    } else {
      return "$a\_$b";
    }
  }

  //Send Messages
  addMessage() {
    String myName =
        _data.currentUserData.firstName + " " + _data.currentUserData.lastName;
    if (true) {
      Map<String, dynamic> chatMessageMap = {
        "sendBy": myName,
        "message": "Hy Dear! How may i help you?",
        'time': DateTime.now().millisecondsSinceEpoch,
      };
      // String chatRoomId = getChatRoomId(myName,widget.customerName);
      AuthData().addMessage(chatRoomId, chatMessageMap);
    }
  }

  late String chatRoomId;
  createChatRoomAndStartConversation() async {
    String myName =
        _data.currentUserData.firstName + " " + _data.currentUserData.lastName;
    if (widget.customerName != myName) {
      List<String> users = [myName, widget.customerName];
      chatRoomId = getChatRoomId(myName, widget.customerName);
      Map<String, dynamic> chatRoomMap = {
        "users": users,
        "chatRoomId": chatRoomId,
      };
      AuthData().addChatRoom(chatRoomId, chatRoomMap).then((value) {
        addMessage();
      });
    } else {
      print('You can not send message to yourself.');
    }
  }

  confirmOrder() {
    createChatRoomAndStartConversation();
    Map<String, dynamic> mapData = {
      "msg":
          "${_data.currentUserData.firstName + " " + _data.currentUserData.lastName} has accepted your order.",
      'time': DateTime.now(),
    };
    notify.addData(widget.order.customerId, mapData);
    Fluttertoast.showToast(
        msg: "Order has been placed Successfully",
        backgroundColor: Colors.green,
        textColor: Colors.white,
        timeInSecForIosWeb: 2);
  }

  cancelOrder() {
    Map<String, dynamic> mapData = {
      "msg":
          "${_data.currentUserData.firstName + " " + _data.currentUserData.lastName} has accepted your order.",
      'time': DateTime.now(),
    };
    notify.addData(widget.order.customerId, mapData);
    Fluttertoast.showToast(
        msg: "Order has been cancelled",
        backgroundColor: Colors.red,
        textColor: Colors.black,
        timeInSecForIosWeb: 2);
  }

  @override
  Widget build(BuildContext context) {
    notify = Provider.of(context);
    _data = Provider.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text(
          "Detail Page",
          style: TextStyle(
            color: Colors.black87,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black87,
            size: 20,
          ),
        ),
      ),
      body: SafeArea(
          child: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Row(
            children: [
              Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.only(left: 10.0, top: 20.0),
                child: CircleAvatar(
                  radius: 45,
                  backgroundColor: Colors.amber,
                  backgroundImage: NetworkImage(widget.customerImage),
                ),
              ),
              SizedBox(width: 10.0),
              Container(
                padding: EdgeInsets.only(top: 15.0),
                child: Text(
                  widget.customerName,
                  style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
              SizedBox(width: 25.0),
              Container(
                padding: EdgeInsets.only(top: 17.0),
                child: Text(
                  "Order id: 348",
                  style: TextStyle(color: Colors.black87, fontSize: 14),
                ),
              ),
            ],
          ),
          Divider(thickness: 1.0, color: Colors.black),
          Row(
            children: [
              Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.only(left: 10.0, top: 20.0),
                  child: Icon(
                    Icons.phone_android_rounded,
                    color: Colors.deepOrange,
                    size: 30,
                  )),
              SizedBox(width: 19.0),
              Container(
                padding: EdgeInsets.only(top: 20.0),
                child: Text(
                  widget.customerPhone,
                  style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.w400,
                      fontSize: 18),
                ),
              ),
              SizedBox(width: 45.0),
            ],
          ),
          Divider(thickness: 1.0, color: Colors.black),
          Row(
            children: [
              Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.only(left: 10.0, top: 20.0),
                  child: Icon(
                    Icons.email_rounded,
                    color: Colors.deepOrange,
                    size: 30,
                  )),
              SizedBox(width: 19.0),
              Container(
                padding: EdgeInsets.only(top: 20.0),
                child: Text(
                  widget.customerEmail,
                  style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.w400,
                      fontSize: 18),
                ),
              ),
              SizedBox(width: 9.0),
            ],
          ),
          Divider(thickness: 1.0, color: Colors.black),
          Row(
            children: [
              Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.only(left: 10.0, top: 20.0),
                  child: Icon(
                    Icons.map_rounded,
                    color: Colors.deepOrange,
                    size: 30,
                  )),
              SizedBox(width: 19.0),
              Container(
                padding: EdgeInsets.only(top: 20.0),
                child: Column(
                  children: [
                    Text(
                      widget.city +
                          ", " +
                          widget.society +
                          ", " +
                          widget.street,
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      "PinCode: " + widget.pincode,
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 9.0),
            ],
          ),
          Divider(thickness: 1.0, color: Colors.black),
          Container(
            padding: EdgeInsets.only(top: 20.0, left: 10.0),
            child: Text("Message",
                style: TextStyle(
                    color: Colors.black87,
                    fontSize: 18,
                    fontWeight: FontWeight.w800)),
          ),
          Container(
            padding: EdgeInsets.only(top: 6.0, left: 10.0),
            child: Text(
                "Hi, please pack green sauce in my order and please tell your delievery boy that he has to come on 2nd floor",
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 14,
                )),
          ),
          Divider(thickness: 1.0, color: Colors.black),
          SizedBox(
            height: 15.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Divider(thickness: 1.8, color: Colors.black),
          ),
          SizedBox(height: 25.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text("Subtotal : ${a}",
                      style: TextStyle(color: Colors.black, fontSize: 14.0)),
                  SizedBox(height: 5.0),
                  Text("Delievery Fee : 150 Rs",
                      style: TextStyle(color: Colors.black, fontSize: 14.0)),
                  SizedBox(height: 5.0),
                  Text("Total: ${a + 150} Rs",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0)),
                ],
              )
            ],
          ),
          SizedBox(height: 40),
          Divider(thickness: 1.5, color: Colors.black),
          notify.isLoading == true
              ? Center(child: CircularProgressIndicator())
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        left: 10.0,
                        top: 15.0,
                      ),
                      child: MaterialButton(
                        onPressed: () {
                          cancelOrder();
                        },
                        color: Colors.redAccent,
                        child: Text("Cancel Order",
                            style: TextStyle(color: Colors.black)),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: 10.0,
                        top: 15.0,
                      ),
                      child: MaterialButton(
                        onPressed: () {
                          confirmOrder();
                        },
                        color: Colors.green,
                        child: Text("Confirm Order",
                            style: TextStyle(color: Colors.white)),
                      ),
                    )
                  ],
                ),
        ],
      )),
    );
  }
}
