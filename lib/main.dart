import 'package:flutter/material.dart';
import 'dart:math';
import 'utils/constants.dart';

void main() {
  runApp(MaterialApp(
    home: DiceRoller(),
    debugShowCheckedModeBanner: false,
  ));
}

class DiceRoller extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _DiceState createState() => _DiceState();
}

class _DiceState extends State<DiceRoller> {
  int diceNumber = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Dice Roller',
          style: TextStyle(
            fontSize: Constants.appTitleFontSize,
            letterSpacing: Constants.appTitleLetterSpacing,
            color: Colors.black,
            fontFamily: 'Play-Bold',
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[
                Colors.purple,
                Colors.blueAccent,
              ],
            ),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                "assets/background/dicebackground3.jpg",
              ),
              fit: BoxFit.fill),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(
                  Constants.ColumnElementsPadding,
                ),
                child: Image.asset(
                  'assets/dice/dice$diceNumber.png',
                  width: Constants.diceWidth,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: Constants.buttonBottomPadding,
              ),
              child: ButtonTheme(
                minWidth: Constants.buttonThemeMinWidth,
                height: Constants.buttonThemeHeight,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      diceNumber = Random().nextInt(6) + 1;
                    });
                  },
                  child: Text(
                    'Good Luck!',
                    style: TextStyle(
                      fontSize: Constants.playButtonFontSize,
                      letterSpacing: Constants.playButtonLetterSpacing,
                      color: Colors.black,
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
