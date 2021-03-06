import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../util.dart';

class AnimatedAlignDemo extends StatefulWidget {
  @override
  _AnimatedAlignDemoState createState() => _AnimatedAlignDemoState();
}

class _AnimatedAlignDemoState extends State<AnimatedAlignDemo> {
  bool isAligned = false;
  List<String> curveList = List();
  Curve _curve = Curves.linear;
  String currentDropDownValue;

  @override
  void initState() {
    curveList = Util().getSortedKeyList();
    currentDropDownValue = curveList.first;
    _curve = Util().curveMap[currentDropDownValue];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.topCenter,
            child: DropdownButton(
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
          ),
        ),
        Expanded(
          child: Stack(
            children: [
              Align(
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.transparent,
                      border: Border.all(
                          color: Colors.blue, style: BorderStyle.solid)),
                ),
                alignment: Alignment.center,
              ),
              AnimatedAlign(
                curve: _curve,
                duration: Duration(seconds: 3),
                child: Container(
                  margin: EdgeInsets.all(8),
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.blue,
                  ),
                ),
                alignment: isAligned ? Alignment.center : Alignment.topLeft,
              ),
              Align(
                alignment: Alignment.center,
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
              )
            ],
          ),
        ),
      ],
    );
  }
}
