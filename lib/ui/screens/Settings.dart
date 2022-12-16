
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pineda_flutter/pages/Login.dart';
import 'package:pineda_flutter/Constants.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Settings extends StatefulWidget {
  static const String routeName = 'Settings';

  @override
  SettingsState createState() => SettingsState();
}

class SettingsState extends State<Settings> {
  final storage = new FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          
          title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Settings', style: TextStyle(
              color: Constants.blackColor,
              fontWeight: FontWeight.w500,
              fontSize: 24.0,
            ),),
           ],
          ),

      backgroundColor: Colors.white,

          elevation: 0,
          actions: [
            IconButton(
              icon: Icon(Icons.logout),
              color: Constants.primaryColor,
              onPressed: () {
                navToLogin(context);
              },
            ),
          ],
        ),


        body: Container(
          child: Center(
            child:SingleChildScrollView(
              child:Column(
                children: <Widget>[
                ]
              ),
            ),
          ),
        ),
    );
  }



void navToLogin(BuildContext context) {
    FirebaseAuth.instance.signOut().then((val) async {
      print("Succesfully signed out");
      await storage.deleteAll();
      Navigator.pushNamed(context, Login.routeName);
    });
    
  }



}