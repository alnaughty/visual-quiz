import "package:flutter/material.dart";
// import 'package:triviaquiz/pages/ScorePage.dart';
// import 'package:triviaquiz/pages/sharedPref.dart';
import 'package:visual_quiz/variables/global.dart';

class HighScorePage extends StatefulWidget { 

  sorted(){
    if (players == null){
      players = players;
    }
     players.sort((m1, m2) {
      var r = m1["score"].compareTo(m2["score"]);
      if (r != 0) return r;
      return m1["score"].compareTo(m2["score"]);
    });
  }

  @override
  _HsState createState() => new _HsState();
}

class _HsState extends State<HighScorePage> {
  MediaQueryData fd;
  @override
  Widget build(BuildContext context) {
    widget.sorted();
    fd = MediaQuery.of(context);
    return Scaffold(
      body: Container(
          width: fd.size.width,
          height: fd.size.height,
          decoration: BoxDecoration(
              color: Colors.orange,
              image: DecorationImage(
                  image: AssetImage('assets/images/masbet.gif'),
                  fit: BoxFit.fitHeight)),
          child: SafeArea(
            child: Column(
              children: <Widget>[
                Container(
                  width: fd.size.width,
                  height: fd.size.height / 5,
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: fd.size.width / 3,
                        height: fd.size.width / 5,
                        child: Image(
                          image: AssetImage('assets/images/crown.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        child: Text(
                          "RANKING",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "CH",
                              fontSize: 30),
                        ),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(247, 166, 35, 1),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(50),
                          bottomRight: Radius.circular(50)),
                      border: Border.all(
                          color: Colors.white.withOpacity(0.3), width: 2)),
                ),
                _RankBox(fd, savedScores[0]["name"],"star1","thropy1",savedScores[0]['score'].toString()),
                _RankBox(fd, savedScores[1]["name"],"star2","thropy2",savedScores[1]['score'].toString()),
                _RankBox(fd, savedScores[2]["name"],"star3","thropy3",savedScores[2]['score'].toString()),
                _RankBox(fd, savedScores[3]["name"],"star","thropy",savedScores[3]['score'].toString()),
                _RankBox(fd, savedScores[4]["name"],"star","thropy",savedScores[4]['score'].toString()),
              ],
              
            ),
          )),
    );
  }
}

class _RankBox extends StatefulWidget {
  final MediaQueryData fd;
  final String name;
  final String star;
  final String tropy;
  final String userScore;
  _RankBox(this.fd, this.name, this.star, this.tropy, this.userScore);
  @override
  __RankBoxState createState() => __RankBoxState();
}

class __RankBoxState extends State<_RankBox> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width / 5,
        decoration: BoxDecoration(
            color: Color.fromRGBO(247, 166, 35, 1),
            borderRadius: BorderRadius.all(Radius.circular(10)),
            border: Border.all(color: Colors.white.withOpacity(0.3), width: 2)),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                width: widget.fd.size.width/6,
                child: Text(
                  "${widget.name}",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 30),
                width: widget.fd.size.width / 3,
                height: widget.fd.size.height / 4,
                child: Center(
                  child: Text('${widget.userScore}',
                    style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                )),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/${widget.star}.png"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(5),
                width: 60,
                height: 60,
                child: Image.asset("assets/images/${widget.tropy}.png"),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(100))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
