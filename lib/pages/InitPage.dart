import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:ui' as prefix0;
import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:flutter_audio_player/flutter_audio_player.dart';
import 'package:page_transition/page_transition.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:visual_quiz/audio/play_audio.dart';
import 'package:hardware_buttons/hardware_buttons.dart' as HardwareButtons;
import 'package:visual_quiz/pages/HighScore.dart';
import 'package:visual_quiz/pages/Category.dart';
import 'package:visual_quiz/variables/global.dart';

class InitPage extends StatefulWidget{
  @override
  _InitState createState() => _InitState();
}
class _InitState extends State<InitPage>{
  StreamSubscription<HardwareButtons.HomeButtonEvent> _homeButtonSubscription;
  void showExitGameConfirm(){
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        contentPadding: EdgeInsets.all(0),
        backgroundColor: Colors.transparent,
        content: BackdropFilter(
          filter: prefix0.ImageFilter.blur(sigmaX: 4.0,sigmaY: 4.0),
          child: Container(
          width: 300,
          height: 150,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                width: 300,
                height: 50,
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text("ARE YOU SURE YOU WANT TO QUIT?",textAlign: TextAlign.center,),
              ),
              Container(
                width: 300,
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    GestureDetector(
                      onTap: (){
                        SystemNavigator.pop();
                        AudioPlayer.removeAllSound();
                      },
                      child: Container(
                      width: 100,
                      height: 50,
                      alignment: AlignmentDirectional.center,
                      child: Text("YES",style: TextStyle(
                        fontSize: 20,
                        color: Colors.white
                      ),),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50)
                      ),
                    ),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.of(context).pop(null);
                      },
                      child: Container(
                      width: 100,
                      height: 50,
                      alignment: AlignmentDirectional.center,
                      child: Text("NO",style: TextStyle(
                        fontSize: 20
                      ),),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 4),
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
      )
    );
  }
  Future<String> get localPath async{
    final dir = await getApplicationDocumentsDirectory();
    return dir.path;
  }
  Future<File> get localFile async{
    final path = await localPath;
    return File('$path/playerslog.txt');
  }
  Future<String> _readFile() async{
    List data;
    try{
      final file = await localFile;
      String body = await file.readAsString();
////      print(body[0] + body[body.length - 1] + "BODY ini");
////      print(body.replaceFirst('[', ''));
//      setState(() {
//        body.replaceFirst('[', '');
//        body.replaceFirst(']', '');
//      });
//      print(body.replaceAll(RegExp(r'[' + ']'), '') );
//      var b1 = body.replaceFirst('[', '');
//      var b2 = body.replaceFirst(']', '');
//      List data = body.split(',');
//      setState(() {
//        data[0] = data[0].toString().replaceAll('[', '');
//        data[data.length-1] = data[data.length-1].toString().replaceFirst(']', '');
//      });
//      print(data.toString() +" DATA INI");
      print(body.replaceAll(" ", '').split('end'));
      List data;
      setState(() {
        data = body.replaceAll(" ", '').split('end');
        data.removeAt(data.length-1);
      });
      print(data);
      for(var x =0;x<data.length;x++){
        print(data[x].toString().split('=='));
        setState(() {
          savedScores[x]['name'] = data[x].toString().split('==')[0];
          savedScores[x]['score'] = data[x].toString().split('==')[1];
//          data[x] = data[x].toString().replaceFirst('.', ',');
//          print(data[x]
//          savedScores[x]['name'] = data[x].toString().split(',')[0].split(':')[1].toString().split('.')[0].toString().trim();
//          savedScores[x]['score'] = data[x].toString().split(',').toString().split('.')[1].toString().split(':')[1].toString().trim();
          savedScores.sort((a,b){
            var fnum = double.parse(a['score'].toString());
            var snum = double.parse(b['score'].toString());
            return snum.compareTo(fnum);
//            return b['score'].toString().compareTo(a['score'].toString());
          });
        });
      }
      print(savedScores);
//      print(data.toString() +" INI AN UNGOD" + data.length.toString());
//      print(players);
//      String jsons = jsonEncode(body);
//      print(jsons);
//      List list = jsonDecode(jsons);
//      print(list.toString() + "LIST INI");
      return body;
    }catch(e){
      return e.toString();
    }
  }
  List data;
  void _assign() async{
    _readFile();
//    data = json.decode(await _readFile());
//    print(data.toString() +" DATA NA GUD");
  }
  @override
  void initState() {
    super.initState();
    _readFile();
    _homeButtonSubscription = HardwareButtons.homeButtonEvents.listen((event) {
      terminate();
    });
    playAudio();
  }
  void terminate(){
    AudioPlayer.removeAllSound();
    SystemNavigator.pop();
  }
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Scaffold(
      body: WillPopScope(
        onWillPop: () {
          terminate();
        },
        child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        // padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
          image: DecorationImage(
            image: AssetImage("assets/images/masbet.gif"),
            fit: BoxFit.fitHeight
          )
        ),
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 20),
                      width: MediaQuery.of(context).size.width,
                      child: Image.asset('assets/images/main.png'),
                    ),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, PageTransition(child: CategoryPage(),type: PageTransitionType.fade));
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/10,vertical: 20),
                  width: MediaQuery.of(context).size.width,
                  height: 70,
                  decoration: BoxDecoration(
                border: Border.all(color: Colors.white.withOpacity(0.2),width: 3),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 10.0, // has the effect of softening the shadow
                    spreadRadius: 0.1, // has the effect of extending the shadow
                    offset: Offset(
                      5.0, // horizontal, move right 10
                      5.0, // vertical, move down 10
                    ),
                  )
                ],
                borderRadius: BorderRadius.circular(10),
                color: Color.fromRGBO(234, 63, 104, 1),
              ),
              alignment: AlignmentDirectional.center,
              child: Row(
                children: <Widget>[
                  Container(
                    width: 70,
                    height: 70,
                    color: Color.fromRGBO(240, 92, 127, 1),
                    alignment: AlignmentDirectional.center,
                    child: Icon(Icons.play_arrow,size: 50,color: Colors.white),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width/2,
                    height: 70,
                    alignment: AlignmentDirectional.center,
                    child: Text("START",style: TextStyle(
                      color: Colors.white,
                      fontFamily: "CH",
                      fontSize: 25
                    ),),
                  )
                ],
              ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, PageTransition(child: HighScorePage(),type: PageTransitionType.fade));
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/10,vertical: 20),
                  width: MediaQuery.of(context).size.width,
                  height: 70,
                  decoration: BoxDecoration(
                border: Border.all(color: Colors.white.withOpacity(0.2),width: 3),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 10.0, // has the effect of softening the shadow
                    spreadRadius: 0.1, // has the effect of extending the shadow
                    offset: Offset(
                      5.0, // horizontal, move right 10
                      5.0, // vertical, move down 10
                    ),
                  )
                ],
                borderRadius: BorderRadius.circular(10),
                color: Color.fromRGBO(247, 166, 35, 1),
              ),
              alignment: AlignmentDirectional.center,
              child: Row(
                children: <Widget>[
                  Container(
                    width: 70,
                    height: 70,
                    color: Color.fromRGBO(243, 176, 67, 1),
                    alignment: AlignmentDirectional.center,
                    child: Icon(Icons.equalizer,size: 50,color: Colors.white),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width/2,
                    height: 70,
                    alignment: AlignmentDirectional.center,
                    child: Text("RANKING",style: TextStyle(
                      color: Colors.white,
                      fontFamily: "CH",
                      fontSize: 25
                    ),),
                  )
                ],
              ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  showExitGameConfirm();
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/10,vertical: 20),
                  width: MediaQuery.of(context).size.width,
                  height: 70,
                  decoration: BoxDecoration(
                border: Border.all(color: Colors.white.withOpacity(0.2),width: 3),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 10.0, // has the effect of softening the shadow
                    spreadRadius: 0.1, // has the effect of extending the shadow
                    offset: Offset(
                      5.0, // horizontal, move right 10
                      5.0, // vertical, move down 10
                    ),
                  )
                ],
                borderRadius: BorderRadius.circular(10),
                color: Color.fromRGBO(128, 129, 130, 1),
              ),
              alignment: AlignmentDirectional.center,
              child: Row(
                children: <Widget>[
                  Container(
                    width: 70,
                    height: 70,
                    color: Color.fromRGBO(154, 155, 156, 1),
                    alignment: AlignmentDirectional.center,
                    child: Icon(Icons.exit_to_app,size: 50,color: Colors.white),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width/2,
                    height: 70,
                    alignment: AlignmentDirectional.center,
                    child: Text("EXIT",style: TextStyle(
                      color: Colors.white,
                      fontFamily: "CH",
                      fontSize: 25
                    ),),
                  )
                ],
              ),
                ),
              ),
          ],   
        ),
      ),
      )
    );
  }
}
class Person {
  String name;
  double score;
  Person(this.name, this.score);

  // named constructor
  Person.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        score = json['score'];

  // method
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'age': score,
    };
  }

}