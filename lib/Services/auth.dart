import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_todo/Models/user.dart';

class AuthService{
  //create a currentUser
  
  CurrentUser? UserfromFirebaseUser(User user){
    return CurrentUser(uid: user.uid);
}
  // An instance of firebase
  FirebaseAuth _auth = FirebaseAuth.instance;
//Register a user
      Future RegisterWithEmailAndPassword(String email,String password) async {
        try{
          UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
          User ? user = result.user;
          return UserfromFirebaseUser(user!);
        } catch(e){
              print(e.toString());
        }
      }
  Stream<CurrentUser?> get user {

    return _auth.authStateChanges()
    //.map((User user) => _userFromFirebaseUser(user)); //  .map((User user) =>    _userFromFirebaseUser(user));
        .map((User ? user) => UserfromFirebaseUser(user!)!);
  }
      //SignIn with email and password
   Future SignInWithEmailAndPassword(String email,String password) async {
        try{
          UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: email);
        } catch(e){
          print(e.toString());
          return null;
        }
    }
// Register with google
  Future RegisterWithGoogle() async {
        try {
          UserCredential result = (await GoogleAuthCredential) as UserCredential;
        } catch(e){

        }
  }
    // Sign Out
  Future signOut() async {
        try{
          return await _auth.signOut();
        }catch(e){
          print(e.toString());
          return null;
        }

  }
}