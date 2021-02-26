import 'package:flutter/material.dart';

import '../util.dart';

class AnimatedOpacityDemo extends StatefulWidget {
  @override
  _AnimatedOpacityDemoState createState() => _AnimatedOpacityDemoState();
}

class _AnimatedOpacityDemoState extends State<AnimatedOpacityDemo> {
  bool isAnimating = false;
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
        SizedBox(
          height: 16,
        ),
        AnimatedOpacity(
          opacity: isAnimating ? 1.0 : 0.2,
          curve: _curve,
          duration: Duration(seconds: 3),
          child: FlutterLogo(
            size: 100,
          ),
        ),
        SizedBox(
          height: 16,
        ),
        FlatButton.icon(
            onPressed: () {
              setState(() {
                isAnimating = !isAnimating;
              });
            },
            icon: Icon(
              Icons.play_circle_filled,
              size: 30,
              color: Colors.greenAccent,
            ),
            label: Text("Click To Play"))
      ],
    );
  }
}
