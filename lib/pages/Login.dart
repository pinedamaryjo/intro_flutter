import 'package:pineda_flutter/mixins/ValidationMixin.dart';
import 'package:pineda_flutter/pages/Dashboard.dart';
import 'package:pineda_flutter/pages/Registration.dart';
import 'package:flutter/material.dart';
import 'package:pineda_flutter/widgets/CustomTextField.dart';
import 'package:pineda_flutter/widgets/PasswordField.dart';
import 'package:pineda_flutter/widgets/PrimaryBtn.dart';
import 'package:pineda_flutter/widgets/SecondaryBtn.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:pineda_flutter/ui/root_page.dart';
import 'package:page_transition/page_transition.dart';

class Login extends StatefulWidget {
  static const String routeName = 'Login';

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with ValidationMixin {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool obscureText = true;
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold (
       backgroundColor: Colors.white,

        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  children: <Widget>[
                    Icon(
                      Icons.h_mobiledata,
                      size: 100.0,
                      color: Colors.purple[700],
                    ),

                    SizedBox(height: 30,),
                    Text(
                      'Heart It!',
                      style: GoogleFonts.bebasNeue(
                        fontSize: 52.0,
                        color: Colors.black87,
                      ),
                    ),

                    SizedBox(height: 10,),
                    Text(
                      'Welcome back, You\'ve been missed!',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 20,
                      )
                    ),




                    SizedBox(height: 40.0),
                    CustomField(
                      label: "Email Address", 
                      hint: "Enter valid email", 
                      icon: Icons.email, 
                      textController: emailController, 
                      inputType: TextInputType.emailAddress,
                      validation: validateEmail,
                    ),
                    SizedBox(height: 20.0),
                    PasswordField(
                      label: "Password", 
                      hint: "Enter password", 
                      textController: passwordController, 
                      obscureText: obscureText, 
                      onTap: setPwdVisibility,
                      validation: validatePassword,
                    ),
                    SizedBox(height: 20.0),
                    PrimaryBtn(
                      text: "Login", 
                      icon: Icons.login, 
                      onPress: () {
                        navToRootPage(context);
                      }
                    ),
                    SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        SecondaryBtn(
                          text: "New User? Register", 
                          onPress: () {
                            navToRegistration(context);
                          }
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void login() {
    if(formKey.currentState.validate()) {
      Navigator.pushNamed(context, Dashboard.routeName);
    }
  }
  
  void setPwdVisibility() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  void navToRegistration(BuildContext context) {
    Navigator.pushNamed(context, Registration.routeName);
  }

  void navToRootPage(BuildContext context) {
    // Navigator.pushNamed(context, RootPage.routeName);
    Navigator.pushReplacement(
    context,
    PageTransition(
        child: RootPage(emailController.text),
        type: PageTransitionType.bottomToTop));
  }
}