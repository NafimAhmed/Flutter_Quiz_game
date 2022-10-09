

import 'dart:async';
import 'dart:convert';

//import 'package:brain_station_test/Event_Detail.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:programming_hero_test/result_page.dart';








class Event_List extends StatefulWidget
{
  const Event_List({Key? key}) : super(key: key);

  @override
  State<Event_List> createState() => _Event_ListState();
}

class _Event_ListState extends State<Event_List> {
  Map <String,dynamic>? sharedPreferenceMap;
  Map <String, dynamic>? apiMap;
  List<dynamic>? list;
  List<String> lst = ['A', 'B', 'C','D'];
  PageController _pageController = PageController();
  int totalScore=0;

  Color isTrue=Colors.green;
  Color isWrong=Colors.red;
  Color btnColor=Colors.white;
  Color sccenColor=Colors.white;


  Future getUserData() async
  {
    var response=await http.get(
        Uri.parse('https://herosapp.nyc3.digitaloceanspaces.com/quiz.json')
    );


    setState((){
      apiMap = jsonDecode(response.body);
    });
    print(list?.length);
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return apiMap!=null?MaterialApp(

      home: Scaffold(

        backgroundColor: Colors.black,


          body: Center(
            child: Center(
              child: Card(
            child:
            PageView.builder(
              physics: NeverScrollableScrollPhysics(),
              controller: _pageController,
                itemCount: apiMap!['questions'].length,
                itemBuilder: (_HomeState, index){




                  return Center(
                    child: Center(
                      child: Container(
                    color: Colors.black,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Padding(padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
                            child: DottedBorder(
                              color: Colors.white,
                              strokeWidth: 2,
                              dashPattern: [
                                5,
                                5,
                              ],
                              child: Container(
                                color: Colors.white,
                                width: 300,
                                child: Row(
                                  children: [

                                    Text("Question : "+(index+1).toString()+"/"+(apiMap!['questions'].length).toString(),//+apiMap!['questions'][index]["score"].toString(),
                                      style: GoogleFonts.raleway(
                                          fontSize: 20,
                                          color: Colors.black
                                      ),
                                    ),

                                    SizedBox(
                                      width: 30,
                                    ),

                                    Text("score : "+totalScore.toString(),//+apiMap!['questions'][index]["score"].toString(),
                                      style: GoogleFonts.raleway(
                                          fontSize: 20,
                                          color: Colors.black
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            )
                        ),
                        ///////////////////////////////////////////
                        Padding(padding: EdgeInsets.fromLTRB(25, 25, 25, 25),
                            child: Container(

                              color: Colors.white,
                              child: Padding(
                                  padding: EdgeInsets.fromLTRB(30, 30, 30, 30),
                                child: DottedBorder(
                              color: Colors.black,
                              strokeWidth: 2,
                              dashPattern: [
                                5,
                                5,
                              ],
                              child: Container(
                                color: Colors.white,
                                child: Column(
                              children: [
                                //////////////////////////////////////
                                Text(""+apiMap!['questions'][index]["score"].toString()+" Point",
                                  style: GoogleFonts.raleway(
                                      fontSize: 20,
                                      color: Colors.black
                                  ),
                                ),
                                SizedBox(height: 10,),

                                //////////////////////////////////////////
                                Image(
                                  image: NetworkImage(
                                    apiMap!['questions'][index]['questionImageUrl'].toString(),
                                  ),
                                  errorBuilder: (BuildContext context, Object obj, StackTrace? stackTrace){
                                     return Image(
                                      image: AssetImage(
                                        'assets/programming_herao.png',
                                      ),
                                      height: 00,
                                      width: 00,
                                    );
                                  },
                                  height: 200,
                                  width: 200,
                                ),

                                /////////////////////////////////////

                                // FadeInImage.assetNetwork(
                                //   placeholder: 'assets/programming_herao.png',
                                //   image: apiMap!['questions'][index]['questionImageUrl'].toString(),//questionImageUrl
                                // ),

                                Container(
                                  color: Colors.white,
                                  // width: 300,
                                  child: Text(apiMap!['questions'][index]['question'].toString(),

                                    style: GoogleFonts.raleway(
                                        fontSize: 16
                                    ),
                                  ),
                                ),

                              ],

                              ),)





                            ),),)
                        ),

                        ////////////////////////////////////////

                        Padding(padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
                            child: DottedBorder(
                              color: Colors.white,
                              strokeWidth: 2,
                              dashPattern: [
                                5,
                                5,
                              ],
                              child: Container(
                                color: Colors.black,
                                // width: 300,
                                child: Column(
                                  children: [


                                    for(int i=0;i<apiMap!['questions'][index]['answers'].length;i++)
                                      MaterialButton(
                                        color: btnColor,//isPressed? apiMap!['questions'][index]['correctAnswer']==lst[i]?isTrue:isWrong :sccenColor,
                                        onPressed: (){

                                          int j=i;
                                          String correctAns=apiMap!['questions'][index]['correctAnswer'].toString();
                                          int k=apiMap!['questions'][index]["score"];

                                          if(lst[j]==correctAns)
                                          {
                                            totalScore=totalScore+k;
                                            setState((){
                                              btnColor=isTrue;
                                            });
                                          }
                                          else{
                                            setState((){
                                              btnColor=isWrong;
                                            });
                                          }


                                          if(apiMap!['questions'].length<=(index+1))
                                          {
                                            if (Navigator.canPop(context)) {
                                              Navigator.pop(context);
                                            } else {
                                              SystemNavigator.pop();
                                            }

                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        ResultPage(totalScore)));
                                          }else{



                                            _pageController.animateToPage(index+1,
                                                duration: Duration(milliseconds: 400),
                                                curve: Curves.easeIn
                                            );

                                            setState((){btnColor=sccenColor;});




                                          }

                                          // _pageController.animateToPage(index+1,
                                          //     duration: Duration(milliseconds: 400),
                                          //     curve: Curves.easeIn
                                          // );

                                        },
                                        child: Container(
                                          color: Colors.white,
                                          width: 240,
                                          height: 30,
                                          child: Text(apiMap!['questions'][index]['answers'][lst[i]].toString(),
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.raleway(
                                                  color: Colors.black,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold
                                              )
                                          ),
                                        )



                                      )

                                  ],
                                )
                              ),
                            )
                        ),



                        /////////////////////////////////////////////////






                        /////////////////////////////////////
                      ],
                    ),),),
                  );
                },
            ),
          ),),)


      ),
    ):Scaffold(
      body: Center(
        child: Text("Loading-----------",
          style: GoogleFonts.raleway(
            fontSize: 30,
            fontWeight: FontWeight.bold
          ),


        ),
      )
    );
  }

  @override
  void initState() {

    getUserData();

    super.initState();


  }
}





