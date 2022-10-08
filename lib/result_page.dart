

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ResultPage extends StatelessWidget
{
  int scr=0;


  ResultPage(this.scr);






  @override
  Widget build(BuildContext context) {
    // TODO: implement build


    setNotedata(scr);
    return Scaffold(
      body: Container(
        color: Colors.black,
        child:
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
                    width: 300,
                    child: Column(
                      children: [
                        Text("  Your score :      ",
                          style: GoogleFonts.raleway(
                              fontSize: 20,
                              color: Colors.white
                          ),
                        ),
                        Text(scr.toString(),

                          style: GoogleFonts.raleway(
                              fontSize: 20,
                              color: Colors.white
                          ),

                        )
                      ],
                    ),
                  ),
                )
            ),



          ],
        ),
      )


    );
  }

  Future<void> setNotedata(int noteValue) async{

    String saved=noteValue.toString();


     final prefs = await SharedPreferences.getInstance();
     if(prefs.getInt("INTdata")!=null) {
       if (prefs.getInt("INTdata")! < noteValue) {
         prefs.setString("noteData", saved);
         prefs.setInt("INTdata", noteValue);
       }
     }else{

       prefs.setString("noteData", saved);
       prefs.setInt("INTdata", noteValue);

     }





  }

}