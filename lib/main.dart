import 'package:flutter/material.dart';
import 'package:time_table/screens/welcome_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'TimeTable Sem 5',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: WelcomeScreen.id,
        routes: {
          WelcomeScreen.id: (context) => WelcomeScreen(),
        });
  }
}
