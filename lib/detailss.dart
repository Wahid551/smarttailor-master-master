import 'package:flutter/material.dart';

class DetailPageofCustomerOrder extends StatefulWidget {
  const DetailPageofCustomerOrder({Key? key}) : super(key: key);

  @override
  _DetailPageofCustomerOrderState createState() =>
      _DetailPageofCustomerOrderState();
}

class _DetailPageofCustomerOrderState extends State<DetailPageofCustomerOrder> {
  @override
  Widget build(BuildContext context) {
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
          onPressed: () {},
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
                      backgroundImage: AssetImage("assets/images/2.jpg"),
                    ),
                  ),
                  SizedBox(width: 10.0),
                  Container(
                    padding: EdgeInsets.only(top: 15.0),
                    child: Text(
                      "Shakeeb Khan",
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
                      "+923147896819",
                      style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.w400,
                          fontSize: 18),
                    ),
                  ),
                  SizedBox(width: 45.0),
                  Container(
                    margin: EdgeInsets.only(
                      left: 10.0,
                      top: 15.0,
                    ),
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailPageofCustomerOrder()));
                      },
                      color: Colors.amber,
                      child: Text("Call", style: TextStyle(color: Colors.black)),
                    ),
                  )
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
                      "shakeeb@gmail.com",
                      style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.w400,
                          fontSize: 18),
                    ),
                  ),
                  SizedBox(width: 9.0),
                  Container(
                    margin: EdgeInsets.only(
                      left: 10.0,
                      top: 15.0,
                    ),
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailPageofCustomerOrder()));
                      },
                      color: Colors.blueAccent,
                      child: Text("Email", style: TextStyle(color: Colors.white)),
                    ),
                  )
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
                          "Old Shujabad Road Multan",
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          "House No: 25",
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 9.0),
                  Container(
                    margin: EdgeInsets.only(
                      left: 10.0,
                      top: 15.0,
                    ),
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailPageofCustomerOrder()));
                      },
                      color: Colors.black87,
                      child:
                      Text("Navigate", style: TextStyle(color: Colors.white)),
                    ),
                  )
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10.0, top: 10),
                    child: Text("Items",
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 20,
                            fontWeight: FontWeight.w600)),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 65.0, top: 10),
                    child: Text("Quantity",
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 20,
                            fontWeight: FontWeight.w600)),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 65.0, top: 10),
                    child: Text("Price",
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 20,
                            fontWeight: FontWeight.w600)),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Divider(thickness: 1.8, color: Colors.black),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10.0, top: 10),
                    child: Text("Dal Makhni",
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 15,
                            fontWeight: FontWeight.w600)),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 65.0, top: 10),
                    child: Text("Qty-2",
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 14,
                            fontWeight: FontWeight.w400)),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 65.0, top: 10),
                    child: Text("100 Rs",
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 20,
                            fontWeight: FontWeight.w600)),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10.0, top: 10),
                    child: Text("Dal Makhni",
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 15,
                            fontWeight: FontWeight.w600)),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 65.0, top: 10),
                    child: Text("Qty-2",
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 14,
                            fontWeight: FontWeight.w400)),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 65.0, top: 10),
                    child: Text("100 Rs",
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 20,
                            fontWeight: FontWeight.w600)),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10.0, top: 10),
                    child: Text("Dal Makhni",
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 15,
                            fontWeight: FontWeight.w600)),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 65.0, top: 10),
                    child: Text("Qty-2",
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 14,
                            fontWeight: FontWeight.w400)),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 65.0, top: 10),
                    child: Text("100 Rs",
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 20,
                            fontWeight: FontWeight.w600)),
                  )
                ],
              ),
              SizedBox(height: 25.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      left: 10.0,
                      top: 15.0,
                    ),
                    child: MaterialButton(
                      onPressed: () {},
                      color: Colors.lightBlue,
                      child: Text("Print Invoice",
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  Column(
                    children: [
                      Text("Subtotal : 1K",
                          style: TextStyle(color: Colors.black, fontSize: 14.0)),
                      SizedBox(height: 5.0),
                      Text("Delievery Fee : 150 Rs",
                          style: TextStyle(color: Colors.black, fontSize: 14.0)),
                      SizedBox(height: 5.0),
                      Text("Total: 1050 Rs",
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      left: 10.0,
                      top: 15.0,
                    ),
                    child: MaterialButton(
                      onPressed: () {},
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
                      onPressed: () {},
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
