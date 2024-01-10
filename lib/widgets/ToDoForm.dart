import 'package:flutter/material.dart';
import 'package:my_todo/Services/firestoreHandler.dart';
import 'package:my_todo/widgets/TextFieldWidget.dart';
class ToDoForm extends StatefulWidget {
  const ToDoForm({Key? key}) : super(key: key);

  @override
  State<ToDoForm> createState() => _ToDoFormState();
}

class _ToDoFormState extends State<ToDoForm> {

  FormFieldsTheme fieldsTheme = FormFieldsTheme();
  final _formkey = GlobalKey<FormState>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  String currentTitle = "";
  String currentDesc =  "";
  late int id = 1;
  int maxCharacters = 100;
  int TremainingCharacters = 100;
  int DremainingCharacters = 20;
  void updateCharacter(String value){
    TremainingCharacters = maxCharacters - value.length;
  }
  void updateCharacter_desc(String value){
    DremainingCharacters = maxCharacters - value.length;
  }
  @override
  Widget build(BuildContext context) {
    DataStorageService _datas = DataStorageService(uid: '');
    return Form(
      key: _formkey,
        child: SingleChildScrollView(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextFormField(
              maxLength: 20,
              controller: titleController,
              decoration: fieldsTheme.textField.copyWith(hintText: "Title"),
              validator: (val) => val!.isEmpty? "please enter a valid title" : "",
              onChanged: (val) {
                setState(() => currentTitle = val);
              }
            ),

           const  SizedBox(height: 20,),
            TextFormField(
              maxLength: 100,
              controller:  descController,
                decoration: fieldsTheme.textField.copyWith(hintText: "Description"),
                validator: (val) => val!.isEmpty ? "please enter a valid description" : null,
                onChanged: (val) {
                 setState(() =>currentDesc = val);

                }
            ),

           const  SizedBox(height: 24,),
            ElevatedButton(
                onPressed:() async {
            //  if (_formkey.currentState!.validate()) {
             //  print("added successfuly");
             //  print(titleController.text);
               await _datas.addTodoDatas(titleController.text, descController.text);
                 Navigator.of(context).pop();
              },
                   child: const Text(
                  "Add Datas" ,style: TextStyle(
                  fontSize:18,
                  color: Colors.orange,
                  fontWeight:FontWeight.bold,)
                  )

            )
          ],

        )
        )
    );
  }
}
