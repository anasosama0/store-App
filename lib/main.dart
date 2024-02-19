import 'package:flutter/material.dart';
import 'package:store_app/screens/home.dart';
import 'package:store_app/screens/update.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      routes: {
        HomePage.id :(context) => const HomePage(),
        UpdatePage.id:(context) =>  UpdatePage(),
      },
      initialRoute: HomePage.id,
      debugShowCheckedModeBanner: false,
    );
  }
}