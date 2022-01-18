import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smarttailor/Provider/product_provider.dart';
import 'package:smarttailor/colors/appcolors.dart';
import 'package:smarttailor/models/Product_Model.dart';
import 'package:smarttailor/productsdescription/shirtdescription.dart';

class BabiesCollection extends StatefulWidget {
  @override
  _BabiesCollectionState createState() => _BabiesCollectionState();
}

class _BabiesCollectionState extends State<BabiesCollection> {
  List<ProductModel> productData = [];
  late ProductProvider productProvider;

  @override
  void initState() {
    ProductProvider _productProvider = Provider.of(context, listen: false);
    _productProvider.getMyProducts();

    super.initState();
  }

  getShirts() {
    List<ProductModel> products =
        productProvider.getMyProductsList.where((element) {
      return element.productCategory.toLowerCase().contains("other") &&
          element.genderCategory == 1;
    }).toList();
    return products;
  }

  @override
  Widget build(BuildContext context) {
    productProvider = Provider.of(context);
    productData = getShirts();
    return productData.isEmpty
        ? Center(
            child: Container(
            child: Center(
              child: Text("No Data"),
            ),
          ))
        : Padding(
            padding: EdgeInsets.only(top: 10, left: 10, right: 10),
            child: GridView.builder(
              itemCount: productData.length,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (context, index) {
                ProductModel data = productData[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ShirtDescription(
                              data: data,
                            )));
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.55,
                    width: MediaQuery.of(context).size.width * 0.25,
                    margin: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        gradient: LinearGradient(
                            colors: [
                              Color(0xffffa500),
                              Color(0xffffc87c),
                            ]
                        ),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey,
                              offset: Offset(1, 1),
                              blurRadius: 5),
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: 10.0,
                        ),
                        Expanded(
                          flex: 2,
                          child: Image(
                            image: NetworkImage(data.productImage),
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                        Text(
                          data.productName,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          );
  }
}
