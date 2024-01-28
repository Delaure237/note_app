import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_todo/Models/TodoItem.dart';
import 'package:my_todo/Models/user.dart';
import 'package:my_todo/Services/auth.dart';
import 'package:my_todo/Services/firestoreHandler.dart';
import 'package:my_todo/Wrapper.dart';
import 'package:my_todo/firebase_options.dart';
import 'package:provider/provider.dart';

void main()  async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<CurrentUser?>(context);
    return MultiProvider(
        providers: [

      StreamProvider<List<Note>>.value(
          catchError: (_,__) => [],
          value:DataStorageService(uid: user!.uid).note,
          initialData: const [],
      ),


      StreamProvider<CurrentUser?>.value(
        catchError: (_,__) => null,
    value: AuthService().user,
    initialData:null,
      )
      ],

      child:MaterialApp(
      title: 'Flutter Demo',
       debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      home: Wrapper()
    )

    );

  }
}

