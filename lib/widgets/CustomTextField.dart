import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  final String label;
  final String hint;
  final IconData icon;
  final TextEditingController textController;
  final TextInputType inputType;
  final Function validation;
   
  CustomField(
    {@required this.label, 
     @required this.hint, 
     @required this.icon, 
     @required this.textController, 
     @required this.inputType,
     @required this.validation
    });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(
        color: Colors.grey[850],
      ),
      controller: textController,
      keyboardType: inputType,
      validator: validation,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(
                    color: Colors.grey[700],
                    width: 1.0,
                  ),
                ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
          borderSide: BorderSide(
                    color: Colors.grey[700],
                    width: 1.0,
                  ),
        ),
        labelText: label,
        labelStyle: TextStyle(
        color: Colors.purple[400]
      ),
        hintText: hint,
        prefixIcon: Container(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: Icon(icon, color: Colors.black),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
          borderSide: BorderSide(
                    color: Colors.grey[700],
                    width: 1.0,
                  ),
        ),
      ),
    );
  }
}