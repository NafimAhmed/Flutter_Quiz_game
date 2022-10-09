



import 'dart:async';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:programming_hero_test/question_answer_page.dart';

import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget
{
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage>
{
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();



  String? hscore;


  @override
  void initState() {
    super.initState();
    getnote();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    Timer.periodic(Duration(seconds: 1), (timer) {
      setState((){
        getnote();

      });

    });

    return MaterialApp(

      home: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
            child: SingleChildScrollView(
              child : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Padding(padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
                child:  DottedBorder(
                  color: Colors.white,
                  strokeWidth: 2,
                  dashPattern: [
                    5,
                    5,
                  ],
                  child: Container(
                    child: Column(
                      children: [

                        Image.asset("assets/programming_herao.png",
                        height: 100,
                          width: 100,
                        ),
                        Text("  Programming Hero      ",
                          style: GoogleFonts.raleway(
                              fontSize: 30,
                            color: Colors.white
                          ),
                        ),
                        Text("Quiz",
                          style: GoogleFonts.raleway(
                              fontSize: 70,
                              fontWeight: FontWeight.bold,
                            color: Colors.white
                          ),
                        )
                      ],
                    ),
                  ),
                )
            ),


            Padding(padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
                child:  DottedBorder(
                  color: Colors.white,
                  strokeWidth: 2,
                  dashPattern: [
                    5,
                    5,
                  ],
                  child: Container(
                    width: 300,
                    child: Column(
                      children: [
                        Text("  Highscore :      ",
                          style: GoogleFonts.raleway(
                              fontSize: 20,
                              color: Colors.white
                          ),
                        ),

                        Container(
                          child: hscore==null?Text("No data") : Text(hscore!,
                            style: GoogleFonts.raleway(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white
                            ),
                          ),



                        ),

                      ],
                    ),
                  ),
                )
            ),


            Padding(padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
                child:  DottedBorder(
                  color: Colors.white,
                  strokeWidth: 2,
                  dashPattern: [
                    5,
                    5,
                  ],
                  child: Container(
                    width: 300,
                    child: Column(
                      children: [
                        ElevatedButton(

                            style: ElevatedButton.styleFrom(
                              primary: Colors.white
                            ),

                            onPressed: (){

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          Event_List()));



                            },
                            child: Text("          Start         ",

                              style: GoogleFonts.raleway(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.black
                              ),
                            ))
                      ],
                    ),
                  ),
                )
            ),




          ],
        ),
        ),
      ),
      ),
    );


  }


  void getnote() async
  {
    final prefs = await SharedPreferences.getInstance();
    hscore = prefs.getString("noteData");



    setState((){
    });
  }



}