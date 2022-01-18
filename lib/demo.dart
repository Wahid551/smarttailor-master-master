import 'package:flutter/material.dart';
import 'package:smarttailor/detailss.dart';

class Ordersss extends StatefulWidget {
  const Ordersss({Key? key}) : super(key: key);

  @override
  _OrdersssState createState() => _OrdersssState();
}

class _OrdersssState extends State<Ordersss> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Customer Orders"),
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: 410,
          margin: EdgeInsets.symmetric(horizontal: 7.0, vertical: 10.0),
          decoration: BoxDecoration(
            color: Colors.white70,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.only(left: 10.0, top: 14.0),
                    child: CircleAvatar(
                      radius: 45,
                      backgroundColor: Colors.amber,
                      backgroundImage: AssetImage("assets/images/2.jpg"),
                    ),
                  ),
                  SizedBox(width: 7.0),
                  Container(
                    padding: EdgeInsets.only(top: 15.0),
                    child: Text(
                      "Shakeeb Khan",
                      style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                          fontSize: 17),
                    ),
                  ),
                  SizedBox(width: 12.0),
                  Container(
                    padding: EdgeInsets.only(top: 30.0),
                    child: Column(
                      children: [
                        Text(
                          "Order id: 348",
                          style:
                          TextStyle(color: Colors.black87, fontSize: 14),
                        ),
                        Text(
                          "Total Amount: 1K",
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 14,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Divider(
                thickness: 1.0,
                color: Colors.black,
              ),
              Row(
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
                    margin: EdgeInsets.only(
                      left: 10.0,
                      top: 15.0,
                    ),
                    child: MaterialButton(
                      onPressed: () {},
                      color: Colors.lightBlue,
                      child: Text("Call Customer",
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      left: 10.0,
                      top: 15.0,
                    ),
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DetailPageofCustomerOrder()));
                      },
                      color: Colors.amber,
                      child: Text("View Details",
                          style: TextStyle(color: Colors.black)),
                    ),
                  )
                ],
              ),
              SizedBox(height: 14.0),
              MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                minWidth: 300,
                onPressed: () {},
                color: Colors.green,
                child: Text("Confirm Order",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w800)),
              ),
              MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                minWidth: 300,
                onPressed: () {},
                color: Colors.redAccent,
                child: Text("Cancel Order",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w800)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
