import 'package:flutter/material.dart';

  class FormFieldsTheme {
    InputDecoration textField = InputDecoration(
       errorStyle: TextStyle(
         color: Colors.orange,       ),
        suffixIconColor: Colors.orange,
        prefixIconColor: Colors.orange,
        hintStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 14,
        ),
        contentPadding: const  EdgeInsets.symmetric(vertical: 5,horizontal: 5),
        filled: true,

        fillColor: Colors.grey[100],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        focusedBorder: const  OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.orange,
            style: BorderStyle.solid,
            width: 1.0,
          )
        )
      );
    TextStyle buttonTextStyle = const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 20,

    );
  }