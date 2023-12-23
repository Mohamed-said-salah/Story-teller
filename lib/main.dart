import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'storyBook.dart';

StoryBook story = StoryBook();

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StoryTeller',
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: MyHome(),
        ),
      ),
    );
  }
}

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

int storyNumber = 0;
Color myColor;
Color myColor2;

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    if (story.bookCahpters[storyNumber].choice1 == 'Restart') {
      myColor2 = Colors.red;
    } else {
      myColor2 = Colors.green;
    }
    if (story.bookCahpters[storyNumber].choice2 != '') {
      myColor = Colors.blue;
    } else {
      myColor = Colors.white;
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          constraints: BoxConstraints(maxHeight: 450.0),
          margin:
              EdgeInsets.only(top: 15.0, bottom: 20.0, right: 15.0, left: 15.0),
          child: Padding(
            padding: const EdgeInsets.only(
                top: 10, bottom: 19.0, left: 10.0, right: 10.0),
            child: SingleChildScrollView(
              child: Text(
                (story.bookCahpters[storyNumber].text +
                    story.bookCahpters[storyNumber].text +
                    story.bookCahpters[storyNumber].text +
                    story.bookCahpters[storyNumber].text),
                textAlign: TextAlign.justify,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.blue[900],
                width: 2.0,
              ),
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
        ),
        Container(
          margin:
              EdgeInsets.only(top: 20.0, right: 15.0, left: 15.0, bottom: 20.0),
          child: Column(
            children: [
              TextButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(myColor2),
                    fixedSize: MaterialStateProperty.all(Size(350.0, 60.0))),
                child: Text(
                  (story.bookCahpters[storyNumber].choice1),
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
                onPressed: () {
                  setState(() {
                    if (storyNumber == 0) {
                      storyNumber = 2;
                    } else if (storyNumber == 1) {
                      storyNumber = 2;
                    } else if (storyNumber == 2) {
                      storyNumber = 5;
                    } else {
                      storyNumber = 0;
                    }
                  });
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: TextButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(myColor),
                      fixedSize: MaterialStateProperty.all(Size(350.0, 60.0))),
                  child: Text((story.bookCahpters[storyNumber].choice2),
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 20.0)),
                  onPressed: () {
                    setState(() {
                      if (storyNumber == 0) {
                        storyNumber = 1;
                      } else if (storyNumber == 1) {
                        storyNumber = 3;
                      } else if (storyNumber == 2) {
                        storyNumber = 4;
                      } else {
                        storyNumber = 0;
                      }
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
