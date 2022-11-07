import 'package:flutter/material.dart';

class PasswordField extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController textController;
  final bool obscureText;
  final Function onTap;
  final Function validation;

  PasswordField({
    @required this.label,
    @required this.hint,
    @required this.textController,
    @required this.obscureText,
    @required this.onTap,
    @required this.validation
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(
        color: Colors.grey[850],
      ),
      controller: textController,
      obscureText: obscureText,
      validator: validation,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
        color: Colors.purple[400]
      ),
        hintText: hint,
        prefixIcon: Container(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: Icon(Icons.lock,  color: Colors.black),
        ),
        suffixIcon: GestureDetector(
          onTap: onTap,
          child: Icon(obscureText ? Icons.visibility_off : Icons.visibility,  color: Colors.black),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
          borderSide: BorderSide(
                    color: Colors.grey[700],
                    width: 1.0,
                  ),
        ),
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
      ),
    );
  }
}