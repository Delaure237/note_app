import 'package:flutter/material.dart';
import 'package:my_todo/Screens/LogIn.dart';
import 'package:my_todo/Screens/Register.dart';
 class Authenticate extends StatefulWidget {


   @override
   State<Authenticate> createState() => _AuthenticateState();
 }

 class _AuthenticateState extends State<Authenticate> {
bool showSignIn = true;
void toggleView(){
  setState(() {
    showSignIn =! showSignIn;
  });
}
   @override
   Widget build(BuildContext context) {
     if(showSignIn){
       return LogInPage(toggleView: toggleView);
     }else{
       return RegisterScreen(toggleView: toggleView);
     }
   }
 }
