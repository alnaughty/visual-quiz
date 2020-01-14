import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class ModeCardPage extends StatefulWidget {
  final String imgUrl;
  final Widget go;
  ModeCardPage(this.imgUrl, this.go);
  @override
  _ModeCardPageState createState() => _ModeCardPageState();
}

class _ModeCardPageState extends State<ModeCardPage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: (){
          Navigator.push(context, PageTransition(child: widget.go,type: PageTransitionType.fade));
        },
          child: Container(
                  decoration: new BoxDecoration(
                    border: Border.all(style: BorderStyle.solid, color: Colors.white, width: 5),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white,
                        blurRadius: 20.0, // has the effect of softening the shadow
                        spreadRadius: 5.0, // has the effect of extending the shadow
                        offset: Offset(
                          10.0, // horizontal, move right 10
                          10.0, // vertical, move down 10
                        ),
                      )
                    ],
                  ),
                  margin: EdgeInsets.only(left: 20, right: 20),
                  width: 300,
                  child: Image.asset(widget.imgUrl.toString(),)  
              ),
    );
  }
}
