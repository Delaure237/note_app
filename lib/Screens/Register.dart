import 'package:flutter/material.dart';
import 'package:my_todo/Screens/Loading.dart';
import 'package:my_todo/Services/auth.dart';
import 'package:my_todo/widgets/TextFieldWidget.dart';
class RegisterScreen extends StatefulWidget {
  final Function toggleView;
  const RegisterScreen({required this.toggleView});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  AuthService _auth = AuthService();
  FormFieldsTheme fieldsTheme = FormFieldsTheme();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  String email = "";
  String password = "";
  String confirmPassword = "";
  String FullName = "";
  String error = "";
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return loading ? Loading() :Scaffold(

      body: SingleChildScrollView(
      child:Column(
        mainAxisAlignment :MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 96,),
          const Padding(
            padding: EdgeInsets.only(left: 12),
            child: Text("Welcome to ",style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 28,
            ),),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 12),
            child: Text("My Notes ",style: TextStyle(
              color: Colors.orange,
              fontWeight: FontWeight.bold,
              fontSize: 28,
            ),),
          ),
          SizedBox(height:24),

          Padding(padding:const  EdgeInsets.symmetric(horizontal: 12),
          child: Form(
            key: _formKey,
              child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(

                    validator:(val) =>   val!.isEmpty ? "Enter a valid name" :null,
                    onChanged:(val) {
                    setState(() => FullName=val);
                     },
                    decoration: fieldsTheme.textField.copyWith(hintText: "FullName",prefixIcon: Icon(Icons.person)),
                  ),
                 const  SizedBox(height:18),
                  TextFormField(
                    validator: (val) =>  val!.isEmpty ? "Enter a valid email" :null,

                    onChanged: (val){
                      setState(() {
                        email = val;
                      });
                    },
                    decoration: fieldsTheme.textField.copyWith(hintText: "Email",prefixIcon: const Icon(Icons.mail)),
                  ),
                 const  SizedBox(height:18),
                  TextFormField(
                    obscureText: isObscure,
                    validator: (val)=> val!.length<8? "Enter a password with 8+ character " :null,
                      onChanged: (val){
                      setState(() {
                        password= val;
                      });
                      },
                    decoration: fieldsTheme.textField.copyWith(hintText: "Password",
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(onPressed: (){
                      setState(() {
                        isObscure =! isObscure;
                      });
                      }, icon: isObscure ? const Icon(Icons.visibility_off_rounded) :const  Icon(Icons.visibility)
                  )
                   )
                  ),
                 const  SizedBox(height:18),
                  TextFormField(
                      obscureText: isObscure,
                      validator: (val)=> val!.length<8? "Enter a password with 8+ character " :null,
                      onChanged: (val){
                        setState(() {
                          confirmPassword = val;
                        });
                      },
                      decoration: fieldsTheme.textField.copyWith(hintText: "Password",
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: IconButton(onPressed: (){
                            setState(() {
                              isObscure =! isObscure;
                            });
                          }, icon: isObscure ? const Icon(Icons.visibility_off_rounded) :const  Icon(Icons.visibility)
                          )
                      )
                  ),
                const   SizedBox(height: 24),
        GestureDetector(

          onTap:() async {
            if(password!= confirmPassword){
              setState(() {
                error = "the passwords don't matching each other";
              });
            }
            if(_formKey.currentState!.validate()){
              setState(() {
                loading = true;
              });
              dynamic result = await _auth.RegisterWithEmailAndPassword(
                  email,password);
              if(result == null){
                setState(() {
                  loading = true;
                });
              }
            }
          },
          child:  Container(
              width: 400,
              height: 56,
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                child: Text("Sign In",
                  textAlign: TextAlign.center,
                  style: fieldsTheme.buttonTextStyle,
                ),
              )
          ),
        ),
                     const  SizedBox(height: 24,),

          ],
              )
          )
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const   Text("Already have an account ?",style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),),
              TextButton(
                  onPressed: (){
                    widget.toggleView();
                  },
                  child: const  Text("Log In",style: TextStyle(
                    color: Colors.orange,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),)
              )
            ],
          )
        ],

      ),
      )
    );
  }
}
