
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ui1/Web_page.dart';

class Welcome_screen extends StatefulWidget {
  const Welcome_screen({Key? key}) : super(key: key);

  @override
  State<Welcome_screen> createState() => _Welcome_screenState();
}

class _Welcome_screenState extends State<Welcome_screen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(children: [
          //3
          Padding(
            padding: const EdgeInsets.only(left: 250,top: 250),
            child: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(500),
                  ),
                  color: Colors.orange.shade700),
            ),
          ),
          //2
          SizedBox(height: 60),
          Container(
            height: 400,
            width: double.infinity,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                transform: GradientRotation(pi/4),
                colors: [
                  Colors.orange.shade700,
                  Colors.orange.shade700,
                  Colors.orange.shade300,
                ],
              ),
            ),
          ),
          //1
          Align(
            alignment:Alignment.topRight,
            child: Container(
              height: 250,
              width: 300,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(500),
                  ),
                  color: Colors.orange.shade300),
            ),
          ),
          //logo
          Padding(
            padding: const EdgeInsets.only(left: 50,top: 300),
            child: Container(
              height: 125,
              width: 125,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white
              ),
              alignment: Alignment.center,
              child: FlutterLogo(size: 60,),
            ),
          ),
          //welcome
          Padding(
            padding: const EdgeInsets.only(left: 50,top: 425),
            child: Text("Welcome",style: TextStyle(fontSize: 70,color: Colors.orange.shade700,fontWeight: FontWeight.bold),),
          ),
          //back
          Padding(
            padding: const EdgeInsets.only(left: 60,top: 500),
            child: Text("back",style: TextStyle(fontSize: 20,color: Colors.orange.shade700),),
          ),
          //as mariya
          Padding(
            padding: const EdgeInsets.only(left: 55,top: 620),
            child:
            InkWell(onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const web_page(),
                  settings: const RouteSettings(
                    arguments: "https://www.freecodecamp.org/",
                  ),
                ),
              );
            },
              child: Container(
                height: 50,
                width: 300,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [
                          Colors.orange.shade700,
                          Colors.orange.shade700,
                          Colors.orange.shade300,
                        ]
                    )
                ),
                alignment: Alignment.center,
                child: Text("Login as Freecodecamp",style: TextStyle(fontSize: 20,color: Colors.white),),
              ),
            ),
          ),
          //delete
          Padding(
            padding: const EdgeInsets.only(left: 140,top: 740),
            child: Text("Delete Account",style: TextStyle(fontSize: 20,color: Colors.black,decoration: TextDecoration.underline),),
          )
        ],),
      ),
    );
  }
}
