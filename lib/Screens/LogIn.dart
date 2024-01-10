import 'package:flutter/material.dart';
import 'package:my_todo/Screens/Loading.dart';
import 'package:my_todo/Services/auth.dart';
import 'package:my_todo/widgets/TextFieldWidget.dart';
class LogInPage extends StatefulWidget {
  final Function toggleView;
  const LogInPage({required this.toggleView});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {



  AuthService _auth = AuthService();
  FormFieldsTheme   fieldsTheme =   FormFieldsTheme();
  final _formKey = GlobalKey<FormState>();
  String email = "";
  bool loading = false;
  String password = "";
  String error = "";
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      body: SafeArea(
     child:  SingleChildScrollView(
    child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
           crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         const  SizedBox(height: 48,),
     const Padding(
     padding: EdgeInsets.only(left: 12),
        child: Text(" Hi,Welcome Back to ",style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),),
      ),
     const  Padding(
        padding: EdgeInsets.only(left: 12),
        child: Text("My Notes ",style: TextStyle(
          color: Colors.orange,
          fontWeight: FontWeight.bold,
          fontSize: 28,
        ),),
      ),

          Padding(padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 80),
           child: Form(
            key: _formKey,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                   children: [


                 const SizedBox(height: 48,),

                  TextFormField(
                  validator: (val) => val!.isEmpty ? "Enter a valid mail" : null ,
              onChanged: (val){
          setState(() {
                email = val;
             });
        },
        decoration: fieldsTheme.textField.copyWith(hintText: "Email",prefixIcon: const Icon(Icons.mail,size: 18)),
                  ),
                     SizedBox(height:24),
                     TextFormField(
                         obscureText: isObscure,
                         validator: (val) => val!.length<8 ? "Enter a password with 8+ character" : null,
                         onChanged: (val){
                           setState(() {
                             password= val;
                           });
                         },
                         decoration: fieldsTheme.textField.copyWith(hintText: "Password",
                             prefixIcon: const Icon(Icons.lock,size: 18,),
                             suffixIcon: IconButton(onPressed: (){
                               setState(() {
                                 isObscure =! isObscure;
                               });
                             }, icon: isObscure ? const Icon(Icons.visibility_off_rounded,size: 18) :const  Icon(Icons.visibility,size: 18)
                             )
                         )
                     ),
                     SizedBox(height:48),
                     GestureDetector(

                       onTap: () async {
                         if (_formKey.currentState!.validate()) {
                           setState(() {
                                loading = true;
                           });
                           dynamic result = await _auth.SignInWithEmailAndPassword(email, password);
                           if (result == null) {
                             setState(() {
                               error = 'could not sign in with those credential';

                             });
                           }
                         }
                       },

                             child: Container(
                                 width: 400,
                                 height: 56,
                                 decoration: BoxDecoration(
                                   color: Colors.orange,
                                   borderRadius: BorderRadius.circular(10),
                                 ),
                                 child: Padding(
                                   padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                                   child: Text("Log In",
                                     textAlign: TextAlign.center,

                                     style: fieldsTheme.buttonTextStyle,
                                   ),
                                 )
                             ),
                           ),
                     const  SizedBox(height: 16.0,),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         const  Text("Don't have an account ?",style: TextStyle(
                           color: Colors.black,
                           fontWeight: FontWeight.bold,
                           fontSize: 16,
                         ),),
                         TextButton(onPressed: (){
                           widget.toggleView();
                         },
                             child: const Text("Sign In",style: TextStyle(
                               color: Colors.orange,
                               fontSize: 18,
                             ),)
                         )
                       ],
                     )

                       ]
                     ),




              )

          )


]
    )
      )
      )
    );
  }
}
