import 'package:flutter/material.dart';
import 'package:my_todo/Models/TodoItem.dart';
import 'package:my_todo/Services/auth.dart';
import 'package:my_todo/Services/firestoreHandler.dart';
import 'package:my_todo/widget/ToDoTile.dart';
import 'package:my_todo/widgets/ToDoForm.dart';
import 'package:provider/provider.dart';

class ToDoList extends StatefulWidget {
  const ToDoList({Key? key}) : super(key: key);

  @override
  State<ToDoList> createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  late TextEditingController titleController = TextEditingController();
  late TextEditingController descController = TextEditingController();
  //double bounce = MediaQuery.of(context).viewInsets.bottom+150;

final   DataStorageService _datas = DataStorageService(uid: '');
  void _showBottomSheet(int? id) {
    showModalBottomSheet(
      isScrollControlled: true,
      elevation: 5,
      backgroundColor: Colors.orange,
        context: context,
        builder: (_)=> Container(
          //  padding: const EdgeInsets.symmetric(vertical: +15,horizontal: 16),

              padding:  EdgeInsets.only(
                top:30,
                left:15,
                right:15,
               bottom:MediaQuery.of(context).viewInsets.bottom+200,
              ),
              child: ToDoForm(),




    )
    );
  }
  Widget build(BuildContext context) {
    final note = Provider.of<List<Note>>(context);
    return Scaffold(
      body: ListView.builder(
          itemCount: note.length,
          itemBuilder:(context,index) {
            return SingleChildScrollView(
                child: Column(
                    children: [

                      ToDoTiles(note: note[index]),

                    ]
                )
            );
          }
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        onPressed: () => _showBottomSheet(null),

        child: const Icon(Icons.add,color: Colors.white,),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }



}
