import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:visual_quiz/pages/ScorePage.dart';
import 'package:visual_quiz/variables/global.dart';


class QuizPage extends StatefulWidget{
  final List conts;
  QuizPage(this.conts);
  @override
  _Qstate createState() => new _Qstate();
}
MediaQueryData fullDevice;
class _Qstate extends State<QuizPage>{
  PageController _controller = new PageController();
  void initState(){
    super.initState();
    widget.conts.shuffle();
    print(widget.conts);
    
  }
  @override
  Widget build(BuildContext context) {
   fullDevice = MediaQuery.of(context);
    return Scaffold(
      body: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: Colors.orange,
                child: SafeArea(
                  child: PageView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: _controller,
                    itemCount: widget.conts.length,
                    itemBuilder: (context,index){
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/masbet.gif'),
                            fit: BoxFit.fitHeight
                          )
                        ),
                        child: Column(
                          children: <Widget>[
                            Container(
                              width: fullDevice.size.width,
                              height: fullDevice.size.height/10,
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    width: fullDevice.size.width/4,
                                    height: fullDevice.size.height/10,
                                    padding: EdgeInsets.all(10),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage('assets/images/page.png'),
                                        ),
                                      ),
                                      alignment: AlignmentDirectional.center,
                                      child: Text("${index+1} / ${widget.conts.length}",style:TextStyle(color: Colors.white,fontFamily:"Tahoma")),
                                    ),
                                  ),

                                  Container(
                                    width: fullDevice.size.width/2,
                                    height: fullDevice.size.height/10,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage("assets/images/category.png")
                                      )
                                    ),
                                    alignment: AlignmentDirectional.center,
                                    child: Text(currentCat.toUpperCase(),style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25
                                    ),)
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: fullDevice.size.width,
                              margin: EdgeInsets.symmetric(horizontal: 20),
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              height: fullDevice.size.height/3,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/images/screen.png'),
                                  fit: BoxFit.fitWidth
                                )
                              ),
                              alignment: AlignmentDirectional.center,
                              child: Container(
                                margin: EdgeInsets.only(bottom: fullDevice.size.height/35),
                                width: fullDevice.size.width - 20,
                                height: fullDevice.size.height/4.3,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: widget.conts[index]['q_img'] != null ? AssetImage(widget.conts[index]['q_img'].toString()) : NetworkImage("https://s3-eu-west-1.amazonaws.com/net.hetras.ibe/web/app/images/noimage.png"),
                                    fit: BoxFit.fitWidth
                                  )
                                ),
                              ),
                            ),
                            Container(
                              width: fullDevice.size.width,
                              height: fullDevice.size.height/6,
                              padding: EdgeInsets.all(10),
                              alignment: AlignmentDirectional.center,
                              child: Text(widget.conts[index]['question'],textAlign: TextAlign.center,style:TextStyle(
                                color: Colors.white,
                                fontFamily: "Tahoma",
                                fontSize: 17
                              )),

                            ),
                            Container(
                              width: fullDevice.size.width,
                              height: fullDevice.size.height/2.9,
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                children: <Widget>[
                                  for(var x =0;x<widget.conts[index]['choices'].length;x++)

                                  Expanded(
                                    child: GestureDetector(
                                      onTap:(){
                                        if(index + 1 != widget.conts.length){
                                          if(widget.conts[index]['answer'] == (x+1).toString()){
                                            setState(() {
                                              score++;
                                            });
                                            print(widget.conts[index]['answer'] + "==" + "${x+1}");
                                          }
                                          _controller.nextPage(duration: kTabScrollDuration, curve: Curves.ease);
                                        }else{
                                          setState(() {
                                            score++;
                                            score = (score/widget.conts.length) * 100;
                                          });
                                          Navigator.push(context, PageTransition(child: ScorePage(),type: PageTransitionType.scale, alignment: Alignment.center, duration: Duration(milliseconds: 700)));
                                        }
                                        print((score/widget.conts.length) * 100);
                                      },
                                      child: Container(
                                          padding: EdgeInsets.symmetric(horizontal: 10),
                                          margin: EdgeInsets.symmetric(vertical: 1),
                                          alignment: AlignmentDirectional.center,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(50),
                                              color: Color.fromRGBO(6, 113, 4, 1)
                                          ),
                                          child: Text(widget.conts[index]['choices'][x]['choice_content'][0].toString().toUpperCase() + widget.conts[index]['choices'][x]['choice_content'].substring(1),textAlign: TextAlign.center, style:TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontFamily: "Tahoma"
                                          ))
                                      ),
                                    ),
                                  )
                                ],
                              )
                            )
                          ],
                        ),
                      );
                    },
                  ),
                )
      ),
    );
  }
}