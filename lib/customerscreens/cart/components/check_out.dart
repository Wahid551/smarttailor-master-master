import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:smarttailor/Provider/check_out_provider.dart';
import 'package:smarttailor/Provider/review_cart_provider.dart';
import 'package:smarttailor/customerscreens/cart/components/delivery_detail.dart';




class CheckoutCard extends StatefulWidget {
  const CheckoutCard({
    Key? key,
  }) : super(key: key);

  @override
  _CheckoutCardState createState() => _CheckoutCardState();
}

class _CheckoutCardState extends State<CheckoutCard> {

  late ReviewProvider reviewProvider;
  String measurement="";
  @override
  Widget build(BuildContext context) {
    CheckoutProvider deliveryAddressProvider = Provider.of(context);
    deliveryAddressProvider.getDeliveryAddressData();
    reviewProvider=Provider.of(context);
    var totalPrice=reviewProvider.getTotalPrice();
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 30,
      ),
      // height: 174,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.15),
          )
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  height: 40,
                  width:40,
                  decoration: BoxDecoration(
                    color: Color(0xFFF5F6F9),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SvgPicture.asset("assets/images/receipt.svg"),
                ),
                Spacer(),
                Text(measurement),
                Spacer(),
                InkWell(
                    onTap: (){
                      showModalBottomSheet(
                          context: context,
                          builder: (context){
                            return Container(
                              height: 160,
                              child: Column(
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets
                                        .symmetric(
                                        vertical: 10,
                                        horizontal: 10),
                                    child: Column(
                                      children: [
                                        InkWell(
                                          onTap: () async {
                                            setState(() {
                                              measurement="Male";
                                            });
                                            Navigator.of(context)
                                                .pop();
                                          },
                                          child: Text(
                                            'Male',
                                            style: TextStyle(
                                                color:Colors.black,
                                                fontSize: 18),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20.0,
                                        ),
                                        InkWell(
                                          onTap: () async {
                                            setState(() {
                                              measurement="Female";
                                            });
                                            Navigator.of(context)
                                                .pop();
                                          },
                                          child: Text(
                                            'Female',
                                            style: TextStyle(
                                                color:Colors.black,
                                                fontSize: 18),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20.0,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }
                      );
                    },
                    child: Text("Select Measurement")),
                const SizedBox(width: 10),
                Icon(
                  Icons.arrow_downward,
                  size: 20,
                  color: Color(0xFF757575),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  TextSpan(
                    text: "Total:\n",
                    children: [
                      TextSpan(
                        text: "\$${totalPrice}",
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 190,
                  child:SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        shape:
                        RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        primary: Colors.white,
                        backgroundColor: Color(0xFFFF7643),
                      ),
                      onPressed: (){
                        if(measurement.isEmpty){
                          Fluttertoast.showToast(msg: "Select Measurement");
                        }
                        else{
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DeliveryDetails(measurement: measurement,)));
                        }

                      },
                      child: Text(
                        "Submit",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}