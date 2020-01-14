import "package:flutter/material.dart";
import 'package:visual_quiz/pages/Difficulty.dart';
import 'package:visual_quiz/variables/global.dart';
import 'package:page_transition/page_transition.dart';

class CategoryPage extends StatefulWidget{
  @override
  _CatState createState() => new _CatState();
}
class _CatState extends State<CategoryPage> {
  @override

  Widget build(BuildContext context) {
    
    return Scaffold(
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Theme.of(context).backgroundColor,
              image: DecorationImage(
                image: AssetImage("assets/images/masbet.gif"),
                fit: BoxFit.fitHeight
              )
            ),
            child: SafeArea(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  padding: EdgeInsets.zero,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/board.png"),
                      fit: BoxFit.fill,
                    )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 40,right: 30, left: 35,),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width,
                          alignment: AlignmentDirectional.center,
                          child: Text("QUIZ CATEGORIES:",style:TextStyle(
                            color:Colors.white.withOpacity(0.8),
                            fontSize: 40,
                            fontFamily: "CH"
                          )),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height/6),
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height/2.5,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              for(var i =0;i<questionArray.length;i++)
                              GestureDetector(
                                onTap: (){
                                  setState(() {
                                   currentCat = questionArray[i]['category_name']; 
                                  });
                                  Navigator.push(context, new PageTransition(child: DifficultyPage(questionArray[i]['difficulty']),type: PageTransitionType.rightToLeft));
                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: MediaQuery.of(context).size.height/10,
                                  child: Image(
                                    image: AssetImage(questionArray[i]["category_img"]),
                                    fit: BoxFit.fill,
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
    );
  }
}