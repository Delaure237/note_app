import 'package:flutter/material.dart';
import 'package:my_todo/Models/TodoItem.dart';
import 'package:my_todo/Models/user.dart';
import 'package:my_todo/Screens/unShow_screen/ToDo_list.dart';
import 'package:my_todo/Services/auth.dart';
import 'package:my_todo/widgets/ToDoForm.dart';
import 'package:provider/provider.dart';
import 'package:my_todo/Services/firestoreHandler.dart';
class HomePage extends StatelessWidget {

   HomePage({Key? key}) : super(key: key);

  @override
 Widget build(BuildContext context) {
    final AuthService _auth = AuthService();

    final user = Provider.of<CurrentUser?>(context);
    return StreamProvider<List<Note>>.value(
        value:DataStorageService(uid: user!.uid).note,
        initialData:  const [],
     child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.orange,
        title: const Text("Notes App",style: TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),),
        actions:<Widget> [
          PopupMenuButton(
              itemBuilder: (BuildContext context){
                return [
                  PopupMenuItem(child:GestureDetector(
                    child: const  ListTile(
                        title:Text("Log Out"),
                        leading: Icon(Icons.login_outlined,)),
                    onTap: (){
                      _auth.signOut();
                    },
                  ),
                  ),
                  PopupMenuItem(child:GestureDetector(

                    child:  const ListTile(
                        title:Text("Setting"),
                        leading: Icon(Icons.settings,)),
                    onTap: (){
                      _auth.signOut();
                    },
                  ),
                  )

                  ];

              }
          )
        ],
      ),
      body: const ToDoList(),




      ),

    );
  }
  }


