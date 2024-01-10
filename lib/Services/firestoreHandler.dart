
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_todo/Models/TodoItem.dart';
import 'package:my_todo/Models/user.dart';

class DataStorageService{
  final String uid;
    DataStorageService({required this.uid});

    // reference Collection
  final CollectionReference NoteCollection = FirebaseFirestore.instance.collection("notes");
  // Add a todoItem
    Future<dynamic> addTodoDatas(String title,String desc) async {
     try{
      return    NoteCollection.add({
        'title': title,
        'desc' : desc,

      }
       );
     } catch(e){
       print("Error during the Adding the element: $e");
     }

    }
    // update a todoItem

Future updateTodoDatas(String newTitle,String newDesc,String id) async {
      try{
        await NoteCollection.doc(uid).update({
          'title':newTitle,
          'desc': newDesc,
       //   'id':id,
        });
      } catch(e){
        print("Error when updating the element :$e");
      }

}
//tdo data fom snapshot
// delete a todoItem

Future deleteToDoDatas(String title,String desc,String id ) async {
      try{
        await NoteCollection.doc(id).delete();
      } catch(e){
        print("error when updating the element :$e");
      }

}
//user Note from snapshot
  UserNote _userNoteFromSnapshot(DocumentSnapshot snapshot){
      return UserNote(
          uid: uid,
          desc: snapshot.data().toString(),
          title: snapshot.data().toString(),
      );
  }
// list from snapshot
List<Note> _noteListFromSnapshots(QuerySnapshot snapshot){
      return snapshot.docs.map((doc){
        return Note(
            title: doc['title'],
            desc: doc['desc'],
             id: doc.id,

        );
      }).toList();
}
// get todos stream
Stream<List<Note>> get note {
      return NoteCollection.snapshots().map(_noteListFromSnapshots);
}
// get user doc stream
Stream<UserNote> get userNote{
      return NoteCollection.doc(uid).snapshots()
      .map(_userNoteFromSnapshot);
}
}