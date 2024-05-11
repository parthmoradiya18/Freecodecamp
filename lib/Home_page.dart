

import 'package:flutter/material.dart';
import 'package:ui1/Web_page.dart';


class Home_page extends StatefulWidget {
  const Home_page({Key? key}) : super(key: key);

  @override
  State<Home_page> createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar:
      PreferredSize(child:  AppBar(
        title: const Text(
          "Freecodecamp",
          style: TextStyle(fontSize: 25,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.pinkAccent.shade100,
      ), preferredSize: Size(0, 50)),

      body: Column(mainAxisAlignment: MainAxisAlignment.center,children: [
        Center(
          child: Container(
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.all(10),
            child:  MaterialButton(
              shape: Border.all(color: Colors.lightGreen.shade900,width: 5),
              color: Colors.indigo[900],
              onPressed: () {
                setState(() {

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const web_page(),
                      settings: const RouteSettings(
                        arguments: "https://www.freecodecamp.org/",
                      ),
                    ),
                  );
                });
              },
              child: const Text(
                "Freecodecamp",
                style: TextStyle(color: Colors.white,letterSpacing: 0.5,fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                ),
              ),
            ),

          ),
        ),
      ],),

    );
  }
}