import "package:flutter/material.dart";
import 'package:page_transition/page_transition.dart';


class MenuButton extends StatefulWidget {
  final String val;
  final Widget go;
  MenuButton(this.val, this.go);
  @override
  _MenuButtonState createState() => _MenuButtonState();
}

class _MenuButtonState extends State<MenuButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
          child: GestureDetector(
            onTap: (){
              Navigator.push(context, PageTransition(child: widget.go,type: PageTransitionType.fade));
            },
              child: Container(
              width: 100,
              height: 50,
              child: Center(child: Text(widget.val.toString(), style: TextStyle(
                fontSize: 25,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),)),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.redAccent),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(234, 63, 104, 1),
                    blurRadius: 20.0, // has the effect of softening the shadow
                    spreadRadius: 0.1, // has the effect of extending the shadow
                    offset: Offset(
                      5.0, // horizontal, move right 10
                      5.0, // vertical, move down 10
                    ),
                  )
                ],
                borderRadius: BorderRadius.circular(40),
                color: Color.fromRGBO(234, 63, 104, 1),
              ),
        ),
          ),
      );
  }
}