import 'package:flutter/material.dart';

import '../util.dart';

class AnimatedPositionDemo extends StatefulWidget {
  @override
  _AnimatedPositionDemoState createState() => _AnimatedPositionDemoState();
}

class _AnimatedPositionDemoState extends State<AnimatedPositionDemo> {
  bool isMoving = false;
  List<String> curveList = List();

  Curve _curve = Curves.linear;
  String currentDropDownValue;

  @override
  void initState() {
    super.initState();
    curveList = Util().getSortedKeyList();
    currentDropDownValue = curveList.first;
    _curve = Util().curveMap[currentDropDownValue];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButton(
            value: currentDropDownValue,
            items: curveList
                .map((value) => DropdownMenuItem<String>(
                      child: Text(value),
                      value: value,
                    ))
                .toList(),
            onChanged: (newValue) {
              setState(() {
                currentDropDownValue = newValue;
                _curve = Util().curveMap[currentDropDownValue];
              });
            }),
        Container(
          width: 300,
          height: 300,
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Text(
                "💵",
                style: TextStyle(fontSize: 30),
              ),
              AnimatedPositioned(
                curve: _curve,
                child: Text(
                  "🧸",
                  style: TextStyle(fontSize: 100),
                ),
                top: isMoving ? 80 : 0,
                duration: const Duration(seconds: 3),
              ),
              Positioned(
                bottom: 0,
                child: FlatButton.icon(
                    onPressed: () {
                      setState(() {
                        isMoving = !isMoving;
                      });
                    },
                    icon: Icon(
                      Icons.play_circle_filled,
                      size: 30,
                      color: Colors.greenAccent,
                    ),
                    label: Text(isMoving ? "Find Money" : "Hide Money")),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
