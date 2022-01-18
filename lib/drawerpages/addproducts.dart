
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:random_string/random_string.dart';
import 'package:smarttailor/Provider/product_provider.dart';
import 'package:smarttailor/colors/appcolors.dart';

class TailorAddProduct extends StatefulWidget {
  const TailorAddProduct({Key? key}) : super(key: key);

  @override
  _TailorAddProductState createState() => _TailorAddProductState();
}

class _TailorAddProductState extends State<TailorAddProduct> {
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final productNameController = TextEditingController();
  final productPriceController = TextEditingController();
  final productDescController = TextEditingController();

  File? selectedImage;
  final picker = ImagePicker();
  // ignore: unused_field
  bool _isLoading = false;
  late ProductProvider _productProvider;

  // Get Image from Gallery
  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        selectedImage = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  // Upload image to Cloud Storage then Add Data To Firestore
  uploadProduct() async {
    if (formKey.currentState!.validate() && selectedImage != null) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Dialog(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: new Row(
                children: [
                  new CircularProgressIndicator(),
                  SizedBox(
                    width: 25.0,
                  ),
                  new Text("Loading, Please wait"),
                ],
              ),
            ),
          );
        },
      );

      /// uploading image to firebase storage
      Reference firebaseStorageRef = FirebaseStorage.instance
          .ref()
          .child("ProductImages")
          .child("${randomAlphaNumeric(9)}.jpg");

      final UploadTask task = firebaseStorageRef.putFile(selectedImage!);

      task.whenComplete(() async {
        try {
          var downloadURL = await firebaseStorageRef.getDownloadURL();
          print("this is url $downloadURL");
          Map<String, dynamic> productMap = {
            "ProductImage": downloadURL,
            "ProductPrice": int.parse(productPriceController.text),
            "ProductName": productNameController.text,
            "ProductDesc": productDescController.text,
            "ProductCategory": valueChoose,
            "GenderCategory": _value,
            "userUid":
            "${randomAlphaNumeric(9)}${FirebaseAuth.instance.currentUser!.uid}",
            "userDocId": FirebaseAuth.instance.currentUser!.uid,
            'DateTime': DateTime.now().toIso8601String(),
          };

          /// Add Data to Firestore
          _productProvider.addProduct(productMap).then((result) {
            Navigator.of(context).pop();
            // Navigator.of(context).pop();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.green,
                content: Text(
                  "Product Added Successfully",
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
            );
          });
        } catch (onError) {
          print("Error");
        }
      });
      // var downloadUrl =
      //     await (await task.whenComplete(() => null)).ref.getDownloadURL();

    } else {}
  }

  var _value = 0;
  var valueChoose;
  List listItems = ["Kameez/Shalwar", "Shirts", "Pants", "Other"];


  @override
  Widget build(BuildContext context) {
    _productProvider = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Products", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 20, wordSpacing: 1.0),),
        backgroundColor: Colors.orange.shade400,
      ),

      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: ListView(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Container(
                height: 160,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.elliptical(400, 500)),
                  gradient: LinearGradient(
                      colors: [Color(0xffffa500), Colors.deepOrangeAccent]),
                ),
              ),
            ),
            Form(
              key: formKey,
              child: Column(
                children: [
                  SizedBox(height: 15.0,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: TextFormField(
                      controller: productNameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Name of Product';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: "Product Name",
                        hintStyle: TextStyle(
                          color: Colors.black54,
                        ),
                        // fillColor: Colors.grey.shade300,
                        // filled: true,
                        prefixIcon: Icon(
                          Icons.drive_file_rename_outline,
                          color: Colors.black,
                          size: 20,
                        ),
                        border: UnderlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: TextFormField(
                      controller: productPriceController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Price';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: "Product Price",
                        hintStyle: TextStyle(
                          color: Colors.black54,
                        ),
                        // fillColor: Colors.grey.shade300,
                        // filled: true,
                        prefixIcon: Icon(
                          Icons.drive_file_rename_outline,
                          color: Colors.black,
                          size: 20,
                        ),
                        border: UnderlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(height: 30.0),
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Text(
                      "Select Gender",
                      style:
                      TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w900),
                    ),
                  ),
                  SizedBox(height: 10.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Radio(
                            activeColor: Colors.orange,
                            value: 1,
                            groupValue: _value,
                            onChanged: (value) {
                              setState(() {
                                _value = value as int;
                              });
                            },
                          ),
                          SizedBox(width: 10),
                          Text("Male",
                              style:
                              TextStyle(color: Colors.black, fontSize: 14)),
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                            activeColor: Colors.orange,
                            value: 2,
                            groupValue: _value,
                            onChanged: (value) {
                              setState(() {
                                _value = value as int;
                              });
                            },
                          ),
                          SizedBox(width: 10),
                          Text("Female",
                              style:
                              TextStyle(color: Colors.black, fontSize: 14)),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 25),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Container(
                      padding: EdgeInsets.only(left: 11, right: 12),
                      decoration: BoxDecoration(
                        // border: Border.all(color: Colors.grey, width: 1),
                        // borderRadius: BorderRadius.circular(20),
                      ),
                      child: DropdownButton(
                        iconDisabledColor: Colors.black,
                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                        elevation: 10,
                        value: valueChoose,
                        onChanged: (val){
                          setState(() {
                            valueChoose = val;
                          });
                        },
                        hint: Text("Select Category", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),),
                        dropdownColor: Colors.orange.shade400,
                        icon: Icon(Icons.arrow_drop_down, color: Colors.black,),
                        iconSize: 34, isExpanded: true,
                        items: listItems.map((valueItem){
                          return DropdownMenuItem(
                            value: valueItem,
                            child: Text(valueItem),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 15),
                        child: Text(
                          "Add Picture",
                          style: TextStyle(color: Colors.black87, fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          getImage();
                        },
                        child: selectedImage != null? Container(
                          margin: EdgeInsets.only(right: 18),
                          height: 80,
                          width: 90,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade400,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(6),
                            child: Image.file(
                              selectedImage!,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ):
                        Container(
                          margin: EdgeInsets.only(right: 18),
                          height: 80,
                          width: 90,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade400,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child:Icon(Icons.add_photo_alternate,
                              size: 55, color: Colors.black),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 25.0,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: TextFormField(
                      controller: productDescController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Description';
                        }
                        return null;
                      },
                      maxLines: 5,
                      decoration: InputDecoration(
                        hintText: "Add Description",
                        hintStyle: TextStyle(
                          color: Colors.black87,
                        ),
                        fillColor: Colors.grey.shade300,
                        filled: true,
                        border: UnderlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  GestureDetector(
                    onTap: () {
                      uploadProduct();
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 75),
                      width: double.infinity,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColors.eigengrauColor,
                          boxShadow: [
                            BoxShadow(
                                color: AppColors.firstScreenContainerColor,
                                spreadRadius: 1,
                                offset: Offset(1, 0),
                                blurRadius: 8)
                          ]),
                      child: Center(
                        child: Text("Submit",
                            style: GoogleFonts.knewave(
                                textStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20))),
                      ),
                    ),
                  ),
                  SizedBox(height: 60),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
