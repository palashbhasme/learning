import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:task1/firebase_options.dart';
import 'package:task1/global_variables.dart';
import 'package:task1/screens/detailsScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);


  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      theme: ThemeData(
        colorScheme: ColorScheme.light(
          primary:GlobalVariables.secondaryColor,

        ),
        appBarTheme:const AppBarTheme(
          color: Colors.black87
        )

      ),
      debugShowCheckedModeBanner: false,
      title: 'Details',
      home: DetailsScreen(),
    );
  }
}
