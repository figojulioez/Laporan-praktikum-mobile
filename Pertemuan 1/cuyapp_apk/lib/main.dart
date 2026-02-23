  import 'package:flutter/material.dart';

  void main() {
    runApp(const MyApp());
  }

  class MyApp extends StatelessWidget {
    const MyApp({super.key});

    @override
    Widget build (BuildContext context) {
      return MaterialApp(
        debugShowCheckedModeBanner : false,
        home: Scaffold(
          appBar: AppBar(title : Text("Aplikasi Hello World")),
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors : [
                  Colors.red,
                  Colors.blue
                ],
                begin: AlignmentGeometry.xy(0, 1),
                end: AlignmentGeometry.xy(-1, 0)
              ),
            ),
            margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
            padding: EdgeInsets.all(10),
            height: 100,
            width: 150,
            
          )
          )
      );
    }
  }