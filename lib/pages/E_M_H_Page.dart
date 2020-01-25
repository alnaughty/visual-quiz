import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:visual_quiz/pages/QuizPage.dart';

class DifficultyChoice extends StatefulWidget{
  final List diff_choices;
  DifficultyChoice(this.diff_choices);
  @override
  createState()=> new _choiceState();
}

class _choiceState extends State<DifficultyChoice>{
  @override
  Widget build(BuildContext context) {
    var scrw = MediaQuery.of(context).size.width;
    var scrh = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: scrw,
        height: scrh,
        padding: EdgeInsets.all(scrw/15),
        decoration: BoxDecoration(
            color: Colors.orange,
            image: DecorationImage(
                image: AssetImage("assets/images/masbet.gif"),
                fit: BoxFit.fitHeight
            )
        ),
        child: Center(
          child: Container(
            width: scrw,
            height: scrh/2.5,
            child: Column(
              children: <Widget>[
                for(var x = 0; x< widget.diff_choices.length;x++)
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, PageTransition(child: QuizPage(widget.diff_choices[x]['questions']), type: PageTransitionType.scale, alignment: Alignment.center, duration: Duration(milliseconds: 700)));
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: scrh/20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(scrw/20),
                          gradient: LinearGradient(
                              colors: x == 0 ? [Colors.green,Colors.green.shade300] : x == 1 ? [Colors.yellow.shade700,Colors.yellow.shade300] : x == 2 ? [Colors.red,Colors.red.shade300] : []
                          ),
                          boxShadow: [
                            BoxShadow(
                                color: x==0 ? Colors.green.shade600 : x == 1 ? Colors.yellowAccent : x == 2 ? Colors.red.shade600 : null,
                                blurRadius: 2,
                                offset: Offset(3,2)
                            )
                          ]
                      ),
                      child: Center(
                        child: Text(widget.diff_choices[x]['type'].toString().toUpperCase(),style: TextStyle(
                          color: Colors.white,
                          fontFamily: "CH",
                        ),),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ),
    );
  }
}