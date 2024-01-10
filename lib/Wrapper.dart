import 'package:flutter/material.dart';
import 'package:my_todo/Models/user.dart';
import 'package:my_todo/Pages/Authentification.dart';
import 'package:my_todo/Pages/HomePage.dart';
import 'package:provider/provider.dart';
class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<CurrentUser?>(context);
   if(user == null){
     return Authenticate();
   } else{
     return  HomePage();
   }
  }
}
