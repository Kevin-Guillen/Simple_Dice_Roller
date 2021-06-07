import 'package:flutter/material.dart';
import 'dart:math';
import 'utils/constants.dart';

void main() {
  runApp(MaterialApp(
    home: Dice(),
    debugShowCheckedModeBanner: false,
  ));
}

class Dice extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _DiceState createState() => _DiceState();
}

class _DiceState extends State<Dice> {
  int DiceNumber = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Dice Roller',
          style: TextStyle(
            fontSize: Constants.appTitleFontSize,
            letterSpacing: Constants.appTitleLetterSpacing,
            color: Constants.appTitleColor,
            fontFamily: 'Play-Bold',
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                Constants.titleBackgroundGradientStart,
                Constants.titleBackgroundGradientEnd,
              ])),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/background/dicebackground3.jpg"),
                fit: BoxFit.fill)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(60.0),
                child:
                    Image.asset('assets/dice/dice$DiceNumber.png', width: 300),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 80.0),
              child: ButtonTheme(
                minWidth: Constants.buttonThemeMinWidth,
                height: Constants.buttonThemeHeight,
                child: RaisedButton(
                  onPressed: () {
                    setState(() {
                      DiceNumber = Random().nextInt(6) + 1;
                    });
                  },
                  child: Text(
                    'Good Luck!',
                    style: TextStyle(
                      fontSize: Constants.playButtonFontSize,
                      letterSpacing: Constants.playButtonLetterSpacing,
                      color: Constants.playButtonTextColor,
                      fontFamily: 'Play-Bold',
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
