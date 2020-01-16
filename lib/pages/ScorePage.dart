import 'dart:convert';
import 'dart:io';

import "package:flutter/material.dart";
import 'dart:ui' as prefix0;
import 'package:page_transition/page_transition.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:visual_quiz/pages/Category.dart';
import 'package:visual_quiz/pages/Difficulty.dart';
import 'package:visual_quiz/pages/Initpage.dart';
import 'package:visual_quiz/variables/global.dart';
import 'dart:async';


class ScorePage extends StatefulWidget{
  @override
  _ScoreState createState() => new _ScoreState();
}
MediaQueryData fd;
class _ScoreState extends State<ScorePage>{
  TextEditingController pName = new TextEditingController();
String name;
Timer _timer;
int _start = 0;
bool show = false;
int indexToChange;
List scores = [];

Future<String> get localPath async{
  final dir = await getApplicationDocumentsDirectory();
  return dir.path;
}
Future<File> get localFile async{
  final path = await localPath;
  return File('$path/playerslog.txt');
}
Future<File> _writeData(String data) async{
  final file = await localFile;
  print('write success! $data');
  return file.writeAsString(data);
}
@override
  void initState() {
    super.initState();
    startTimer();
  }
  List toSave;

  _saveData() async {
    int nullCounter = savedScores.where((c)=> c['name'] == "null").toList().length;
    if(nullCounter == 0) {
      for (var xx = 0; xx < savedScores.length; xx++) {
        double savedScoreToConvert = double.parse(savedScores[xx]['score'].toString());
        print(savedScoreToConvert.toString() + "MAO INI an < $score");
        if (savedScoreToConvert <
            score) {
          setState(() {
            savedScores[savedScores.length-1]['name'] = pName.text;
            savedScores[savedScores.length-1]['score'] = score.toString();
          });
          break;
        }
      }
    }else{
      setState(() {
        savedScores[5-nullCounter]['name'] = pName.text;
        savedScores[5-nullCounter]['score'] = score.toString();
      });
    }
    print(savedScores);
    int counter = savedScores.where((c)=> c['name'] != "null").toList().length;
    print(counter);
    var dataToSave = '';
    for(var y =0; y<counter;y++){
      dataToSave += '${savedScores[y]['name']} == ${savedScores[y]['score']} end ';
    }
    print(dataToSave);
    _writeData(dataToSave);
  }
void startTimer() {
  const oneSec = const Duration(milliseconds: 10);
  _timer = new Timer.periodic(
    oneSec,
    (Timer timer) => setState(
      () {
        if (_start == score) {
          _timer.cancel();
          enterName();
//          for(var xx = 0; xx < savedScores.length;xx++){
//            if(savedScores[4]['score'] != null && score > int.parse(savedScores[xx]['score'])){
//              enterName();
//              setState(() {
//                indexToChange = xx;
//              });
//              break;
//            }
//          }
        } else {
          _start = _start + 1;
        }
      },
    ),
  );
}

void enterName(){
    showDialog(
      context: context,
      builder:(_) => Scaffold(
        backgroundColor: Colors.transparent,
        key: _scaff,
        body: Container(
          alignment: Alignment.center,
          color: Colors.transparent,
          child: BackdropFilter(
              filter: prefix0.ImageFilter.blur(sigmaX: 4.0,sigmaY: 4.0),
              child: Container(
              width: 400,
              height: 200,
              decoration: BoxDecoration(
                color: Color.fromRGBO(255, 205, 65, 1),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Color.fromRGBO(217, 163, 13, 1),
                ),
              ),
              child: Container(
                color: Colors.transparent,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      width: 300,
                      height: 50,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                        Text("Your Score: "),
                        Text("$score"),
                      ],),
                    ),

                    Container(
                      margin: EdgeInsets.only(left: 100, right: 100,),
                      decoration: BoxDecoration(

                        border: Border.all(color: Colors.white, width: 4),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        controller: pName,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter your name'
                        ),
                         onChanged: (value) {
                            setState(() {
                               players[4].name = value;
                               players[4].score = score;
                            });
                          },
                      ),
                    ),

                    Container(
                      width: 300,
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          GestureDetector(
                            onTap: (){
                          //call here
                              if(pName.text.isEmpty){
                                _scaff.currentState.showSnackBar(SnackBar(
                                  content: Text("Enter Player Name!"),
                                  duration: Duration(milliseconds: 500),
                                ));
                              }else{
//                                setState(() {
//
////                                  for(var x = 0;x < scores.length;x++){
////                                    if(scores[x]['score'] < score){
////                                      scores[x]['score'] = score;
////                                      scores[x]['name'] = pName.text;
////                                      break;
////                                    }
////                                  }
//                                });
                                Navigator.of(context).pop(null);
                                _saveData();
                              }
                            },
                            child: Container(
                            width: 100,
                            height: 50,
                            alignment: AlignmentDirectional.center,
                            child: Text("Save",style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),),
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(35, 155, 162, 1),
                              border: Border.all(color: Colors.white, width: 4),
                              borderRadius: BorderRadius.circular(50)
                            ),
                          ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ),
        ),
      )
    );
  }
  GlobalKey<ScaffoldState> _scaff = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context){
    fd = MediaQuery.of(context);
    return Scaffold(
      body: WillPopScope(
        onWillPop: ()async=> false,
        child: ListView(
        padding: EdgeInsets.all(0),
        children: <Widget>[
          Container(
            width: fd.size.width,
            height: fd.size.height,
            color: Color.fromRGBO(248, 178, 2, 1),
            child: SafeArea(
              child: Column(
                children: <Widget>[
                  Container(
                    width: fd.size.width,
                    height: fd.size.height/10,
                    alignment: AlignmentDirectional.center,
                    child: Image(
                      image: AssetImage("assets/images/starbet.png"),
                    ),
                  ),
                  Container(
                    width: fd.size.width,
                    height: fd.size.height/10 + 30,
                    child: Image(
                      image: AssetImage("assets/images/Design.png"),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Container(
                    width: fd.size.width,
                    height: fd.size.height/10,
                    alignment: AlignmentDirectional.center,
                    child: Text("WELL PLAYED!",
                      style: TextStyle(
                        shadows: [
                          Shadow(
                            offset: Offset(1,1),
                            color: Colors.black
                          )
                        ],
                        color: Color.fromRGBO(211, 151, 0, 1),
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  Container(
                    width: fd.size.width,
                    height: fd.size.height/15,
                    alignment: AlignmentDirectional.topCenter,
                    child: Text("Score",style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Tahoma",
                      fontSize: 30
                    ),),
                  ),

                  Container(
                    width: fd.size.width,
                    alignment: AlignmentDirectional.topCenter,
                    child: Text("$_start%",style: TextStyle(
                      color: Color.fromRGBO(211, 151, 0, 1),
                      fontWeight: FontWeight.bold,
                      fontSize: 50,
                      shadows: [
                          Shadow(
                            offset: Offset(1,1),
                            color: Colors.black
                          )
                        ],
                    ),),
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
                    width: fd.size.width,
                    height: fd.size.height/10,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Color.fromRGBO(255, 189, 49, 1), Color.fromRGBO(255, 229, 164, 1)],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter
                            ),
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(color: Colors.white)
                          ),
                          width: fd.size.height/10,
                          height: fd.size.height/10,
                          child: IconButton(
                            onPressed: (){
                              Navigator.push(context, new PageTransition(child: InitPage(), type: PageTransitionType.upToDown));
                              setState(() {
                               score = 0.0; 
                              });
                            },
                            icon: Icon(Icons.home, color: Colors.white,size: 50,),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Color.fromRGBO(255, 189, 49, 1), Color.fromRGBO(255, 229, 164, 1)],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter
                            ),
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(color: Colors.white)
                          ),
                          width: fd.size.height/10,
                          height: fd.size.height/10,
                          child: IconButton(
                            onPressed: (){
                              
                              Navigator.push(context, new PageTransition(child: CategoryPage(), type: PageTransitionType.upToDown));
                              setState(() {
                               score = 0.0; 
                              });
                            },
                            icon: Icon(Icons.category, color: Colors.white,size: 50,),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
      ),
      
    );

  }
}

