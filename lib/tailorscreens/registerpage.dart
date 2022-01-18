import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:random_string/random_string.dart';
import 'package:smarttailor/Provider/Female_Suit_Prices.dart';
import 'package:smarttailor/Provider/Man_suit_prises_provider.dart';
import 'package:smarttailor/colors/appcolors.dart';
import 'package:smarttailor/tailorscreens/loginpage.dart';



class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final firstNameEditingController = TextEditingController();
  final lastNameEditingController = TextEditingController();
  final emailEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();
  final genderEditingController = TextEditingController();
  final phoneNumberEditingController = TextEditingController();
  final shopNameEditingController = TextEditingController();
  final addressEditingController = TextEditingController();

  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var _value = 0;
  File? selectedImage;
  final picker = ImagePicker();
  late MenPricesProvider _maleProvider;
  late FemalePricesProvider _femaleProvider;

  // Pick Image
  pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    // ignore: unnecessary_null_comparison
    if (pickedFile != null) {
      setState(() {
        selectedImage = File(pickedFile.path);
      });
    } else {
      print('No image selected.');
    }
  }

  // Register User
  registerUser() async {
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
          .child("UserImages")
          .child("${randomAlphaNumeric(9)}.jpg");
      final UploadTask task = firebaseStorageRef.putFile(selectedImage!);

      task.whenComplete(() async {
        try {
          var downloadURL = await firebaseStorageRef.getDownloadURL();
          print("this is url $downloadURL");

          /// Add Data to Firestore
          UserCredential result = await FirebaseAuth.instance
              .createUserWithEmailAndPassword(
              email: emailEditingController.text,
              password: passwordEditingController.text);
          User? user = result.user;

          _firestore
              .collection("UserRecord")
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .set({
            "FirstName": firstNameEditingController.text,
            "LastName": lastNameEditingController.text,
            "Email": emailEditingController.text,
            "Gender": _value,
            "userImage": downloadURL,
            "phone": phoneNumberEditingController.text,
            "Address": addressEditingController.text,
            "ShopName": shopNameEditingController.text,
            "userUid": user!.uid,
          }).then((value) {
            _maleProvider.addPrices();
            _femaleProvider.addPrices();
            user.sendEmailVerification();
          });

          Navigator.of(context).pop();
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) =>LoginPages(),
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.green,
              content: Text(
                "Registered Successfully. Please Login.. check your email for verification",
                style: TextStyle(fontSize: 20.0),
              ),
            ),
          );
        } on FirebaseAuthException catch (e) {
          Navigator.of(context).pop();
          if (e.code == 'weak-password') {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.red,
                content: Text(
                  "Password Provided is too Weak",
                  style: TextStyle(fontSize: 18.0, color: Colors.black),
                ),
              ),
            );
          } else if (e.code == 'email-already-in-use') {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.red,
                content: Text(
                  "Account Already exists",
                  style: TextStyle(fontSize: 18.0, color: Colors.black),
                ),
              ),
            );
          }
        }
      });
    }
  }

  // var _value = 0;
  @override
  Widget build(BuildContext context) {
    _maleProvider = Provider.of(context);
    _femaleProvider = Provider.of(context);
    return Scaffold(
      body: SafeArea(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            child: ListView(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    height: 190,
                    width: 170,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.elliptical(400, 400)),
                      gradient: LinearGradient(
                          colors: [Color(0xffffa500), Colors.deepOrangeAccent]),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Row(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "R",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 35,
                          ),
                        ),
                      ),
                      Text(
                        "E",
                        style: TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.bold,
                          fontSize: 35,
                        ),
                      ),
                      Text(
                        "G",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 35,
                        ),
                      ),
                      Text(
                        "I",
                        style: TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.bold,
                          fontSize: 35,
                        ),
                      ),
                      Text(
                        "S",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 35,
                        ),
                      ),
                      Text(
                        "T",
                        style: TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.bold,
                          fontSize: 35,
                        ),
                      ),
                      Text(
                        "E",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 35,
                        ),
                      ),
                      Text(
                        "R",
                        style: TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.bold,
                          fontSize: 35,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                GestureDetector(
                    onTap: () {
                      pickImage();
                    },
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: AppColors.eigengrauColor,
                      child: selectedImage != null
                          ? CircleAvatar(
                        backgroundImage: FileImage(selectedImage!),
                        radius: 45,
                        backgroundColor: Colors.white,
                      )
                          : CircleAvatar(
                        radius: 50,
                        // backgroundImage: ExactAssetImage("assets/images/tail.png"),
                        backgroundColor: AppColors.eigengrauColor,
                        child: Icon(
                          Icons.add_photo_alternate_outlined,
                          color: AppColors.coralColor,
                          size: 30,
                        ),
                      ),
                    )),
                SizedBox(height: 20),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: TextFormField(
                          controller: firstNameEditingController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter First Name';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              hintText: "First Name",
                              hintStyle: TextStyle(
                                color: Colors.black54,
                              ),
                              fillColor: Colors.grey.shade300,
                              filled: true,
                              prefixIcon: Icon(
                                Icons.person,
                                color: Colors.black,
                                size: 20,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide.none,
                              )),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: TextFormField(
                          controller: lastNameEditingController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Last Name';
                            }
                            return null;
                          },
                          decoration: InputDecoration(

                              hintText: "Last Name",
                              hintStyle: TextStyle(
                                color: Colors.black54,
                              ),
                              fillColor: Colors.grey.shade300,
                              filled: true,
                              prefixIcon: Icon(
                                Icons.person,
                                color: Colors.black,
                                size: 20,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide.none,
                              )),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: TextFormField(
                          controller: emailEditingController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Email';
                            } else if (!value.contains('@')) {
                              return 'Please Enter Valid Email';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              hintText: "Enter your email",
                              hintStyle: TextStyle(
                                color: Colors.black54,
                              ),
                              fillColor: Colors.grey.shade300,
                              filled: true,
                              prefixIcon: Icon(
                                Icons.email,
                                color: Colors.black,
                                size: 20,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide.none,
                              )),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: TextFormField(
                          controller: passwordEditingController,
                          validator: (value) {
                            if (value == null || value.length < 6) {
                              return 'Please Enter 6+ number Password';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              hintText: "Enter password",
                              hintStyle: TextStyle(
                                color: Colors.black54,
                              ),
                              fillColor: Colors.grey.shade300,
                              filled: true,
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Colors.black,
                                size: 20,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide.none,
                              )),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Gender",
                            style:
                            TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w900),
                          ),
                          Row(
                            children: [
                              Radio(
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
                      SizedBox(
                        height: 8,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: TextFormField(
                          controller: phoneNumberEditingController,
                          keyboardType: TextInputType.phone,
                          validator: (value) {
                            if (value == null || value.length < 11) {
                              return 'Enter Valid Phone Number';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              hintText: "Phone Number",
                              hintStyle: TextStyle(
                                color: Colors.black54,
                              ),
                              fillColor: Colors.grey.shade300,
                              filled: true,
                              prefixIcon: Icon(
                                Icons.phone,
                                color: Colors.black,
                                size: 20,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide.none,
                              )),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: TextFormField(
                          controller: shopNameEditingController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Shop Name';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              hintText: "Shop Name",
                              hintStyle: TextStyle(
                                color: Colors.black54,
                              ),
                              fillColor: Colors.grey.shade300,
                              filled: true,
                              prefixIcon: Icon(
                                Icons.shop,
                                color: Colors.black,
                                size: 20,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide.none,
                              )),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: TextFormField(
                          controller: addressEditingController,
                          maxLines: 5,
                          decoration: InputDecoration(
                              hintText: "Enter your Address",
                              hintStyle: TextStyle(
                                color: Colors.black54,
                              ),
                              fillColor: Colors.grey.shade300,
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide.none,
                              )),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: GestureDetector(
                          onTap: (){
                            registerUser();
                          },
                          child: Container(
                            height: 40,
                            width: 300,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                Color(0xffffa500),
                                Colors.deepOrangeAccent,
                              ]),
                            ),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Register",
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 19),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 25.0,),
                    ],
                  ),
                ),

              ],
            ),
          )),
    );
  }
}
