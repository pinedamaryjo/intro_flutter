import 'package:pineda_flutter/pages/Login.dart';
import 'package:pineda_flutter/routes.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    theme: ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.cyan,
      accentColor: Colors.deepPurple,
      textTheme: TextTheme(
        headline5: TextStyle(
          fontSize: 72.0,
          fontWeight: FontWeight.bold
        ),
        headline6: TextStyle(
          fontSize: 36.0,
          fontStyle: FontStyle.italic
        ),
        bodyText2: TextStyle(
          fontSize: 18.0,
        ),
      ),
    ),
    home: Login(),
    routes: routes,
  ));
}