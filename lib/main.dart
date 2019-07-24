import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
      title: "contador de pessoas",
      home: home()));
}

class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {

  int _people = 0;
  //usar underline no inicio da variavel quer dizer que ela so vai esta acessivel dentro da classe
  String _infotext = "Pode entrar!";
  void changePeople(int delta){
    setState(() {
      _people += delta;
      if(_people < 0){
        _infotext = "mundo invertido!?";
      }else if(_people <= 10 ){
        _infotext = "pode entrar!";

      }else {
        _infotext = "casa cheia!";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          "images/restaurant.jpg",
          fit: BoxFit.cover,
          height: 1000.0,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Pessoas: $_people",
              style:
              TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(
                    child: Text(
                      "+1",
                      style: TextStyle(color: Colors.white, fontSize: 40),
                    ),
                    onPressed: () {
                      changePeople(1);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(
                    child: Text(
                      "-1",
                      style: TextStyle(color: Colors.white, fontSize: 40),
                    ),
                    onPressed: () {
                      changePeople(-1);
                    },
                  ),
                )
              ],
            ),
            Text(
              _infotext,
              style: TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  fontSize: 27),
            )
          ],
        )
      ],
    );
  }
}

