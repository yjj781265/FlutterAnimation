import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimatedAlignDemo extends StatefulWidget {
  @override
  _AnimatedAlignDemoState createState() => _AnimatedAlignDemoState();
}

class _AnimatedAlignDemoState extends State<AnimatedAlignDemo> {
  bool isAligned = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          child: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.transparent,
                border:
                    Border.all(color: Colors.blue, style: BorderStyle.solid)),
          ),
          alignment: Alignment.center,
        ),
        AnimatedAlign(
          duration: Duration(seconds: 3),
          child: Container(
            margin: EdgeInsets.all(8),
            width: 190,
            height: 190,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.blue,
            ),
          ),
          alignment: isAligned ? Alignment.center : Alignment.topLeft,
        ),
        Padding(
          padding: const EdgeInsets.all(64),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: FlatButton.icon(
                onPressed: () {
                  setState(() {
                    isAligned = !isAligned;
                  });
                },
                icon: Icon(
                  Icons.play_circle_filled,
                  size: 30,
                  color: Colors.greenAccent,
                ),
                label: Text("Click To Play")),
          ),
        )
      ],
    );
  }
}
