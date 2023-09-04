import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:job_clone_app/LoginPage/login_screen.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  //const MyApp({super.key});

  final Future<FirebaseApp> _initialization =Firebase.initializeApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future:_initialization,
        builder: (context, snapshot)
        {
          if(snapshot.connectionState == ConnectionState.waiting)
          {
             return const MaterialApp(
               home: Scaffold(
                 body: Center(
                   child: Text('job clone app being ',
                   style: TextStyle(
                      color: Colors.cyan,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Signatra'
                    ),
                   ),
                 ),
               ),
             );
          }
          else if(snapshot.hasError){
            return const MaterialApp(
              home: Scaffold(
                body: Center(
                  child: Text('An error has benn occured',
                    style: TextStyle(
                        color: Colors.cyan,
                        fontSize: 40,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
            );

          }
         return  MaterialApp(
           title: 'Job Clone App',
           theme: ThemeData(
             scaffoldBackgroundColor: Colors.black,
             primarySwatch: Colors.blue,
           ),
           home: Login(),
         );
        }
    );
  }
}
