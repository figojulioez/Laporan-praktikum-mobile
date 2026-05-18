import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "J.C.H Figo L. - 2410506001",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,

            ),
          ),
          backgroundColor: const Color.fromARGB(255, 31, 107, 70),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  color: const Color.fromARGB(255, 45, 163, 106),
                  child: Center(
                    child: Container(
                      height: 200,
                      width: 200,
                      child: CircleAvatar(
                        backgroundImage: AssetImage('images/avatar.jpg'),
                      ),
                    ),
                  )
                  
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  color: const Color.fromARGB(255, 255, 255, 255),
                  child: Increment()
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Increment extends StatefulWidget {
  const Increment({super.key});
  
  @override
  State<Increment> createState() => IncrementChild();
}

class IncrementChild extends State<Increment> {
  int counter = 10;

  void tambah() {
    setState(() {
      counter += 5;
    });
  }

  void kurang() {
    setState(() {
        if (counter != 0) {    
          counter = counter - 1;
        }
    });
  }
 
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            kurang();
          },
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              color:  const Color.fromARGB(255, 45, 163, 106),
              borderRadius: BorderRadius.circular(5)
            ),
            padding: EdgeInsets.all(10),
            width: 50,
            child: Center(
              child: Text(
                "-",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            )
          ),
        ),
        Container(
          height: 50,
          width: 150,
          child: Center(
            child: Text(
              '$counter',
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            tambah();
          },
          child: Container(
            height: 50,
            padding: EdgeInsets.all(10),
            width: 50,
            decoration: BoxDecoration(
                color:  const Color.fromARGB(255, 45, 163, 106),
                borderRadius: BorderRadius.circular(5)
              ),
            child: Center(
                child: Text(
                  "+",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
          ),
        ),
      ],
    );
  }
}