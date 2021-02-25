import 'package:flutter/material.dart';

import '../util.dart';

class AnimatedTextStyleDemo extends StatefulWidget {
  @override
  _AnimatedTextStyleDemoState createState() => _AnimatedTextStyleDemoState();
}

class _AnimatedTextStyleDemoState extends State<AnimatedTextStyleDemo> {
  bool _isAnimated = false;
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
          },
        ),
        SizedBox(height: 100),
        AnimatedDefaultTextStyle(
          child: Text("Flutter is awesome"),
          duration: Duration(seconds: 3),
          curve: _curve,
          style: _isAnimated
              ? TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                  fontSize: 30,
                )
              : TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
        ),
        SizedBox(
          height: 50,
        ),
        FlatButton.icon(
            onPressed: () {
              setState(() {
                _isAnimated = !_isAnimated;
              });
            },
            icon: Icon(
              Icons.play_circle_filled,
              size: 30,
              color: Colors.greenAccent,
            ),
            label: Text("Click To Play")),
      ],
    );
  }
}
