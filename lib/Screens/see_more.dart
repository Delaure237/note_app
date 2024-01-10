import 'package:flutter/material.dart';
import 'package:my_todo/Models/TodoItem.dart';
import 'package:my_todo/Models/user.dart';
import 'package:provider/provider.dart';

import '../Services/firestoreHandler.dart';
class SeeMore extends StatefulWidget {
  final Note notes;
  const SeeMore({required this.notes}) ;

  @override
  State<SeeMore> createState() => _SeeMoreState();
}

class _SeeMoreState extends State<SeeMore> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  final DataStorageService _datas = DataStorageService(uid: '');

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<CurrentUser?>(context);
    final note = Provider.of<Note>(context);
    /* return StreamBuilder<UserNote>(
        stream: DataStorageService(uid:user!.uid ).userNote,
        builder: (context,snapshot){

          if(snapshot.hasData){
           UserNote? usernote = snapshot.data;


    } else{

    }


  }*/
    /*  return   StreamBuilder<List<Note>>(
        stream: DataStorageService(uid: user!.uid).task,
        builder:(context,index) {*/
    return StreamProvider<List<Note>?>.value(
        value: DataStorageService(uid: user!.uid).note,
        initialData: null,
     child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.orange,
          title: const Text("Notes App", style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),),
        ),
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 14, vertical: 16),
            child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [


                    titre("Title"),
                  const   SizedBox(height: 12,),
                    TextFormField(
                      initialValue: note.title,
                      controller: titleController,
                      maxLength: 20,
                      //style: Theme.of(context).textTheme.headline5,
                      decoration: InputDecoration(
                          alignLabelWithHint: true,
                          labelStyle: const  TextStyle(
                            color: Colors.orange,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.orange,

                            ),
                            borderRadius: BorderRadius.circular(10),
                          )
                      ),
                    ),
                   const  SizedBox(height: 24,),
                    titre("description"),
                    const SizedBox(height: 12,),
                    TextFormField(
                      initialValue: note.desc,
                      controller: descController,
                      maxLength: 100,
                      decoration: InputDecoration(
                          alignLabelWithHint: true,

                          labelStyle: const TextStyle(
                            color: Colors.orange,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.orange,

                            ),
                            borderRadius: BorderRadius.circular(10),
                          )
                      ),
                      maxLines: 5,
                    ),
                    SizedBox(height: 24,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          child: Container(
                            padding:const  EdgeInsets.symmetric(
                                horizontal: 49, vertical: 16),
                            margin: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 5),
                            height: 50,
                            width: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.grey[200],
                            ),
                            child: const Text("Cancel", style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),),
                          ),

                        ),
                        GestureDetector(
                          onTap: () {
                            String newTitle = titleController.text;
                            String newDesc = descController.text;
                            _datas.updateTodoDatas(newTitle, newDesc, '');
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 60, vertical: 14),
                            height: 50,
                            width: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.orange,
                            ),
                            child: const Text("Edit", style:  TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),),
                          ),

                        )
                      ],
                    )
                  ],
                )
            )
        )
    )
    );
  }
  }
  Widget titre(String text) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.orange,
        fontSize: 14,
        fontWeight: FontWeight.bold,

      ),
      textAlign: TextAlign.left,
    );
  }


