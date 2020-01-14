import 'package:flutter/material.dart';

class AnswerButton extends StatefulWidget {
  @override
  _AnswerButtonState createState() => _AnswerButtonState();
}

class _AnswerButtonState extends State<AnswerButton> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
              child: Container(
              width: MediaQuery.of(context).size.width/2,
              height: 100,
              color: Colors.red[300],
              ),                   
            );
  }
}