import 'package:flutter/material.dart';
import 'package:my_todo/Models/TodoItem.dart';
import 'package:my_todo/Services/firestoreHandler.dart';
import 'package:my_todo/widgets/ToDoForm.dart';

import '../Screens/see_more.dart';

class ToDoTiles extends StatelessWidget {
  final Note note;
  const ToDoTiles({required this.note});


  @override

  Widget build(BuildContext context) {
    final TextEditingController titleController = TextEditingController();
    final TextEditingController descController = TextEditingController();
    DataStorageService _datas = DataStorageService(uid: '');
   SeeMore _more = SeeMore(notes: note[index],);


DataStorageService db = DataStorageService(uid: '');
    return Padding(
      padding: const  EdgeInsets.symmetric(vertical: 8,horizontal: 8),
      child: GestureDetector(
        onTap: (){

          Navigator.push(context,MaterialPageRoute(builder: (context) => _more) );
        },
      child:Card(
        surfaceTintColor: Colors.white,
        elevation: 4.0,
        margin:const  EdgeInsets.fromLTRB(8.0, 6.0, 8.0, 0.0),
        child: ListTile(
          title: Text(note.title,style:const  TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),),

          subtitle: Text(note.desc,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w400,
              fontSize: 16,
            ),),
          trailing: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children:[
                IconButton(onPressed: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context) => _more) );
                },icon:const Icon(Icons.edit)
                ),
                IconButton(onPressed: (){
                db.deleteToDoDatas(note.title, note.desc,note.id);
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  backgroundColor: Colors.orange,
                  duration: Duration(seconds: 1),

                  content:Text("Note Deleted"),
                ));

                },icon:const Icon(Icons.delete))
              ]
          ),
        ),
      ),
      )
    );
  }
}

