import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:visual_quiz/pages/QuizPage.dart';

class DifficultyPage extends StatefulWidget{
  final List diff;
  DifficultyPage(this.diff);
  @override
  _DiffState createState() => _DiffState();
}
class _DiffState extends State<DifficultyPage>{
  final PageController ctrl = PageController(viewportFraction: 0.8);
  int currentPage = 0;
  Stream slides;

  void initState(){
    super.initState();
     ctrl.addListener(() { 
      int next = ctrl.page.round();

      if(currentPage != next) { 
        setState(() {
          currentPage = next;
        });
      } 
    });
  
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: Container(
        width: MediaQuery.of(context).size.width,
       height: MediaQuery.of(context).size.height,
       decoration: BoxDecoration(
         color: Colors.orange,
         image: DecorationImage(
           image: AssetImage("assets/images/masbet.gif"),
           fit: BoxFit.fitHeight
         )
       ),
        
        child: PageView.builder(
          controller: ctrl,
          itemCount: widget.diff.length,
        
          itemBuilder: (context, index){
            bool active = index == currentPage;
            return _buildStoryPage(index,active);
          },
        ),
      ),
    );
  }

  _buildStoryPage(int index, bool active) {
     // Animated Properties
    
    final double blur = active ? 30 : 0;
    final double offset = active ? 20 : 0;
    final double top = active ? 100 : 160;
    final double fontsize = active ? 15 : 10;
    
  

    return AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeOutQuint,
                  margin: EdgeInsets.only(top: top, bottom: 70, right: 10),
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                        Expanded(
                          flex:2,
                            child: Container(
                            padding: EdgeInsets.only(top: 0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                              image: DecorationImage(
                                image: AssetImage(widget.diff[index]['diff-avatar'],
                                ),
                                fit: BoxFit.fill,
                              )
                            ),
                          ),
                        ),
                      
                        Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              child: Column(children: <Widget>[
                                SizedBox(height: 40),
                                Container(
                                  alignment: Alignment.center,
                                    width: MediaQuery.of(context).size.width,
                                    child: Text('${widget.diff[index]['difficulty_name']}'.toUpperCase(),style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey
                                    ),),
                                ),

                                Container(
                                  margin: EdgeInsets.only(top: 0, bottom: 0),
                                  padding: EdgeInsets.all(8),
                                  width: MediaQuery.of(context).size.width,
                                  height: MediaQuery.of(context).size.height - 550,
                                  child: Text('${widget.diff[index]['grade_desc']}', 
                                  style: TextStyle(
                                  color: Colors.grey[500],
                                  fontSize: fontsize,
                                ), textAlign: TextAlign.justify,),
                                
                                ),
                                
                              ],),
                            ),
                          ),
                     
                        GestureDetector(
                              onTap: (){
                                Navigator.push(context, PageTransition(child: QuizPage(widget.diff[index]['content']), type: PageTransitionType.scale, alignment: Alignment.center, duration: Duration(milliseconds: 700)));
                              },
                              child: Container(
                                padding: EdgeInsets.all(0),
                                margin: EdgeInsets.fromLTRB(20,0,20,50),
                                width: MediaQuery.of(context).size.width,
                                height: 40,
                                alignment: AlignmentDirectional.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  color: Color.fromRGBO(6, 113, 4, 1),
                                  
                                ),
                                child: Text('Play', style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "CH",
                                  fontSize: 20),),
                              ),
                        ),
                    ],
                  ),
                      decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white,
                      boxShadow: [BoxShadow(color: Colors.black87, blurRadius: blur, offset: Offset(offset, offset))]
                      ),
                      

    );
  }

}

