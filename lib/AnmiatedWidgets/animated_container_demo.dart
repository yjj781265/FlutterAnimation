import 'package:flutter/material.dart';

import '../util.dart';

class AnimatedContainerDemo extends StatefulWidget {
  @override
  _AnimatedContainerDemoState createState() => _AnimatedContainerDemoState();
}

class _AnimatedContainerDemoState extends State<AnimatedContainerDemo> {
  bool isBigger = false;
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
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedContainer(
                curve: _curve,
                duration: Duration(seconds: 3),
                child: FlutterLogo(),
                width: isBigger ? 300 : 100,
                height: isBigger ? 300 : 100,
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
          ),
        ),
      ],
    );
  }
}
