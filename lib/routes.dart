import 'package:pineda_flutter/pages/Dashboard.dart';
import 'package:pineda_flutter/pages/Login.dart';
import 'package:pineda_flutter/pages/Registration.dart';
import 'package:pineda_flutter/ui/screens/Settings.dart';
import 'package:flutter/cupertino.dart';

final Map<String, WidgetBuilder> routes = {
  Login.routeName: (BuildContext context) => Login(),
  Registration.routeName: (BuildContext context) => Registration(),
  // Dashboard.routeName: (BuildContext context) => Dashboard(),
  Settings.routeName: (BuildContext context) => Settings()
};