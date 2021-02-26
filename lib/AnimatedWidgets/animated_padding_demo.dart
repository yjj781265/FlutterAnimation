import 'package:flutter/material.dart';

import '../util.dart';

class AnimatedPaddingDemo extends StatefulWidget {
  @override
  _AnimatedPaddingDemoState createState() => _AnimatedPaddingDemoState();
}

class _AnimatedPaddingDemoState extends State<AnimatedPaddingDemo> {
  List<String> curveList = List();
  bool isBigger = false;
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
        SizedBox(height: 16,),
        Container(
          color: Colors.greenAccent,
          child: AnimatedPadding(
            curve: _curve,
            padding: EdgeInsets.all(isBigger ? 50 : 8),
            duration: const Duration(seconds: 3),
            child: Container(
              height: 100,
              width: 150,
              color: Colors.blue,
            ),
          ),
        ),
        SizedBox(
          height: 16,
        ),
        FlatButton.icon(
            onPressed: () {
              setState(() {
                isBigger = !isBigger;
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
