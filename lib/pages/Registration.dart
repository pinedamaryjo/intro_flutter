import 'package:pineda_flutter/pages/Login.dart';
import 'package:pineda_flutter/widgets/CustomTextField.dart';
import 'package:pineda_flutter/widgets/PasswordField.dart';
import 'package:pineda_flutter/widgets/PrimaryBtn.dart';
import 'package:flutter/material.dart';
import 'package:pineda_flutter/mixins/ValidationMixin.dart';



class Registration extends StatefulWidget {
  static const String routeName = 'Registration';

  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> with ValidationMixin {
  GlobalKey<FormState> formKey = GlobalKey<FormState>(); 
  final TextEditingController establishmentController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController pwdController = TextEditingController();
  final TextEditingController pwdConfController = TextEditingController();
  final TextEditingController fnameController = TextEditingController();
  final TextEditingController lnameController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  bool obscureText = true;
  bool obscureTextConf = true;
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
       
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 25,),
                    Text(
                      'Register New User',
                      style: TextStyle(
                        color: Colors.grey[800],
                        fontWeight: FontWeight.bold, 
                        fontSize: 24,
                        fontStyle: FontStyle.italic
                      )
                    ),

                    SizedBox(height: 20.0),
                      CustomField(
                      label: "First Name", 
                      hint: "Enter first name", 
                      icon: Icons.person, 
                      textController: fnameController, 
                      inputType: TextInputType.text, 
                      validation: validateName,
                    ),
                    
                    SizedBox(height: 20.0),
                      CustomField(
                      label: "Last Name", 
                      hint: "Enter last name", 
                      icon: Icons.person, 
                      textController: lnameController, 
                      inputType: TextInputType.text, 
                      validation: validateName,
                    ),
                    
                    SizedBox(height: 20.0),
                    CustomField(
                      label: "Email Address", 
                      hint: "Enter valid email address", 
                      icon: Icons.email, 
                      textController: emailController, 
                      inputType: TextInputType.emailAddress, 
                      validation: validateEmail,
                    ),

                    
                    SizedBox(height: 20.0),
                    PasswordField(
                      label: "Password", 
                      hint: "Enter password", 
                      textController: pwdController, 
                      obscureText: obscureText, 
                      onTap: setPwdVisibility, 
                      validation: validatePassword,
                    ),
                    
                    SizedBox(height: 20.0),
                    PasswordField(
                      label: "Confirm password", 
                      hint: "Re-enter password", 
                      textController: pwdConfController, 
                      obscureText: obscureTextConf, 
                      onTap: setPwdConfVisibility, 
                      validation: (val) {
                        String error;
                        if(val.isEmpty) {
                          error = "Password cannot be empty";
                        } else if(val.length < 8) {
                          error = "Password is too short";
                        } else if(!(RegExp(r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$").hasMatch(val))) {
                          error = "Password is too weak";
                        } else if(pwdController.text != val) {
                          error = "Password does not match";
                        } else {
                          error = null;
                        }

                        return error;
                      }
                    ),
                    
                    SizedBox(height: 20.0),
                    PrimaryBtn(
                      text: "SIGN UP", 
                      icon: Icons.app_registration,
                      onPress: () {
                        register();
                      }
                    ),
                    SizedBox(height: 20.0),
                    PrimaryBtn(
                      text: "LOGIN", 
                      icon: Icons.app_registration,
                      onPress: () {
                        navToLogin(context);
                      }
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

  void register() {
    if(formKey.currentState.validate()) {
      Navigator.pushNamed(context, Login.routeName);
    }
  }

  void navToLogin(BuildContext context) {
    Navigator.pushNamed(context, Login.routeName);
  }

  void setPwdVisibility() {
    setState(() {
      obscureText = !obscureText;
    });
  }
  void setPwdConfVisibility() {
    setState(() {
      obscureTextConf = !obscureTextConf;
    });
  }

}