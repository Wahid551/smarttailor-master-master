import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:smarttailor/Provider/measurement.dart';
import 'package:smarttailor/colors/appcolors.dart';
import 'package:smarttailor/models/Measurement_Model.dart';

class MaleMeasurement extends StatefulWidget {
  const MaleMeasurement({Key? key}) : super(key: key);

  @override
  _MaleMeasurementState createState() => _MaleMeasurementState();
}

class _MaleMeasurementState extends State<MaleMeasurement> {
  final GlobalKey _formKey = new GlobalKey();
  late MaleMeasurementProvider _maleMeasurementProvider;

  late MeasurementModel data;

  saveData() async {
    Map<String, String> _mapData = {
      "height": Height,
      "arm": Arm,
      "shoulder": Shoulder,
      "neck": Neck,
      "upperChest": UpperChest,
      "lowerKWidth": LowerKWidth,
      "length": Length,
    };
    await _maleMeasurementProvider.updateMaleData(_mapData).then((value) {});
  }

  late String Height = data.height,
      Arm = data.arm,
      Shoulder = data.shoulder,
      Neck = data.neck,
      UpperChest = data.upperChest,
      LowerKWidth = data.lowerKWidth,
      Length = data.length;
  @override
  Widget build(BuildContext context) {
    _maleMeasurementProvider = Provider.of(context);
    data = _maleMeasurementProvider.currentUserData;
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 90),
                child: Column(
                  children: [
                    Text(
                      "Male",
                      style: GoogleFonts.knewave(
                          textStyle: TextStyle(
                              color: AppColors.eigengrauColor, fontSize: 18)),
                      textScaleFactor: 1.2,
                    ),
                    Text(
                      "Measurement",
                      style: GoogleFonts.knewave(
                          textStyle: TextStyle(
                              color: AppColors.eigengrauColor, fontSize: 18)),
                      textScaleFactor: 1.2,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Shirt/Kameez",
                    style: GoogleFonts.lobster(
                        textStyle: TextStyle(
                            color: AppColors.eigengrauColor, fontSize: 20)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 260, left: 10),
                child: Divider(
                  thickness: 2,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 15),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    ListTile(
                        title: Text("Height"),
                        trailing: SizedBox(
                          width: 100,
                          height: 30,
                          child: TextFormField(
                            initialValue: Height,
                            onChanged: (val) {
                              setState(() {
                                Height = val;
                              });
                            },
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                fillColor: Color(0xffffa343),
                                filled: true,
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 20),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                )),
                          ),
                        )),
                    ListTile(
                        title: Text("Arm"),
                        trailing: SizedBox(
                          width: 100,
                          height: 30,
                          child: TextFormField(
                            initialValue: Arm,
                            onChanged: (val) {
                              setState(() {
                                Arm = val;
                              });
                            },
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                fillColor: Color(0xffffa343),
                                filled: true,
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 20),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                )),
                          ),
                        )),
                    ListTile(
                        title: Text("Shoulder"),
                        trailing: SizedBox(
                          width: 100,
                          height: 30,
                          child: TextFormField(
                            initialValue: Shoulder,
                            onChanged: (val) {
                              setState(() {
                                Shoulder = val;
                              });
                            },
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                fillColor: Color(0xffffa343),
                                filled: true,
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 20),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                )),
                          ),
                        )),
                    ListTile(
                        title: Text("Neck"),
                        trailing: SizedBox(
                          width: 100,
                          height: 30,
                          child: TextFormField(
                            initialValue: Neck,
                            onChanged: (val) {
                              setState(() {
                                Neck = val;
                              });
                            },
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                fillColor: Color(0xffffa343),
                                filled: true,
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 20),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                )),
                          ),
                        )),
                    ListTile(
                        title: Text("Upper Chest"),
                        trailing: SizedBox(
                          width: 100,
                          height: 30,
                          child: TextFormField(
                            initialValue: UpperChest,
                            onChanged: (val) {
                              setState(() {
                                UpperChest = val;
                              });
                            },
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                fillColor: Color(0xffffa343),
                                filled: true,
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 20),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                )),
                          ),
                        )),
                    ListTile(
                        title: Text("Lower/Kameez Width"),
                        trailing: SizedBox(
                          width: 100,
                          height: 30,
                          child: TextFormField(
                            initialValue: LowerKWidth,
                            onChanged: (val) {
                              setState(() {
                                LowerKWidth = val;
                              });
                            },
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                fillColor: Color(0xffffa343),
                                filled: true,
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 20),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                )),
                          ),
                        )),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Shalwar",
                          style: GoogleFonts.lobster(
                              textStyle: TextStyle(
                                  color: AppColors.eigengrauColor,
                                  fontSize: 20)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 295, left: 10),
                      child: Divider(
                        thickness: 2,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 15),
                    ListTile(
                        title: Text("Length"),
                        trailing: SizedBox(
                          width: 100,
                          height: 30,
                          child: TextFormField(
                            initialValue: Length,
                            onChanged: (val) {
                              setState(() {
                                Length = val;
                              });
                            },
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                fillColor: Color(0xffffa343),
                                filled: true,
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 20),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                )),
                          ),
                        )),
                  ],
                ),
              ),
              SizedBox(height: 20),
              _maleMeasurementProvider.isLoading == true
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : SizedBox(
                      width: 300,
                      child: SizedBox(
                        width: double.infinity,
                        height: 40,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            primary: Colors.white,
                            backgroundColor: Color(0xffffa343),
                          ),
                          onPressed: () {
                            saveData();
                          },
                          child: Text(
                            "Save & Continue",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ),
                    ),
              SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}
