import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smarttailor/colors/appcolors.dart';

// ignore: must_be_immutable
class SettingScreen extends StatelessWidget {
  String imageUrl = "https://avatars.githubusercontent.com/u/73787635?v=4";

  bool val = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                color: AppColors.loadAnimationColor,
                margin: EdgeInsets.all(8.0),
                elevation: 8.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                child: ListTile(
                  // Open Edit Profile
                  onTap: () {},
                  title: Text(
                    "Hamza Zahoor",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w600),
                  ),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(imageUrl),
                  ),
                  trailing: Icon(Icons.edit),
                ),
              ),
              SizedBox(height: 10.0),
              Card(
                elevation: 4.0,
                margin: EdgeInsets.fromLTRB(32, 8, 32, 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.lock_outline,
                          color: AppColors.loadAnimationColor),
                      title: Text("Change Password"),
                      trailing: Icon(Icons.keyboard_arrow_right),
                      // Open Change Password
                      onTap: () {},
                    ),
                    ListTile(
                      leading: Icon(Icons.email,
                          color: AppColors.loadAnimationColor),
                      title: Text("Change Email"),
                      trailing: Icon(Icons.keyboard_arrow_right),
                      // Open Change Password
                      onTap: () {},
                    ),
                    ListTile(
                      leading: Icon(Icons.phone,
                          color: AppColors.loadAnimationColor),
                      title: Text("Change Mobile No"),
                      trailing: Icon(Icons.keyboard_arrow_right),
                      // Open Change Password
                      onTap: () {},
                    ),
                    ListTile(
                      leading: Icon(FontAwesomeIcons.language,
                          color: AppColors.loadAnimationColor),
                      title: Text("Change Language"),
                      trailing: Icon(Icons.keyboard_arrow_right),
                      // Open Change Language
                      onTap: () {},
                    ),
                    ListTile(
                      leading: Icon(Icons.location_on,
                          color: AppColors.loadAnimationColor),
                      title: Text("Change Location"),
                      trailing: Icon(Icons.keyboard_arrow_right),
                      // Open Change Location
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Notification Settings",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo,
                ),
              ),
              SwitchListTile(
                contentPadding: EdgeInsets.all(0),
                activeColor: AppColors.loadAnimationColor,
                value: true,
                title: Text(
                  "Received Notification",
                ),
                onChanged: (value) {
                  val = value;
                },
              ),
              SwitchListTile(
                contentPadding: EdgeInsets.all(0),
                activeColor: AppColors.loadAnimationColor,
                onChanged: (val) {},
                value: false,
                title: Text(
                  "Received Offer Notifications",
                ),
              ),
              SwitchListTile(
                contentPadding: EdgeInsets.all(0),
                activeColor: AppColors.loadAnimationColor,
                onChanged: (val) {},
                value: false,
                title: Text(
                  "Received App Updates",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
