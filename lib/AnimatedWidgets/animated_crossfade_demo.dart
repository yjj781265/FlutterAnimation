import 'package:flutter/material.dart';

import '../util.dart';

class AnimatedCrossFadeDemo extends StatefulWidget {
  @override
  _AnimatedCrossFadeDemoState createState() => _AnimatedCrossFadeDemoState();
}

class _AnimatedCrossFadeDemoState extends State<AnimatedCrossFadeDemo> {
  bool _isFaded = true;
  String _firstCurveDropDownValue;
  String _secondCurveDropDownValue;
  List<String> _curveList = List();
  Curve _firstCurve = Curves.linear;
  Curve _secondCurve = Curves.linear;

  @override
  void initState() {
    _curveList = Util().getSortedKeyList();
    _firstCurveDropDownValue = _curveList.first;
    _secondCurveDropDownValue = _curveList.first;
    _firstCurve = Util().curveMap[_firstCurveDropDownValue];
    _secondCurve = Util().curveMap[_secondCurveDropDownValue];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("First Curve:"),
            SizedBox(width: 8),
            DropdownButton(
                value: _firstCurveDropDownValue,
                items: _curveList
                    .map((value) => DropdownMenuItem<String>(
                          child: Text(value),
                          value: value,
                        ))
                    .toList(),
                onChanged: (newValue) {
                  setState(() {
                    _firstCurveDropDownValue = newValue;
                    _firstCurve = Util().curveMap[_firstCurveDropDownValue];
                  });
                }),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Second Curve:"),
            SizedBox(width: 8),
            DropdownButton(
                value: _secondCurveDropDownValue,
                items: _curveList
                    .map((value) => DropdownMenuItem<String>(
                          child: Text(value),
                          value: value,
                        ))
                    .toList(),
                onChanged: (newValue) {
                  setState(() {
                    _secondCurveDropDownValue = newValue;
                    _secondCurve = Util().curveMap[_secondCurveDropDownValue];
                  });
                }),
          ],
        ),
        SizedBox(
          height: 16,
        ),
        AnimatedCrossFade(
            firstChild: FirstChild(),
            secondChild: SecondChild(),
            firstCurve: _firstCurve,
            secondCurve: _secondCurve,
            crossFadeState:
                _isFaded ? CrossFadeState.showFirst : CrossFadeState.showSecond,
            duration: Duration(seconds: 3)),
        Padding(
          padding: const EdgeInsets.all(64),
          child: FlatButton.icon(
              onPressed: () {
                setState(() {
                  _isFaded = !_isFaded;
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
    );
  }
}

class FirstChild extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
      alignment: Alignment.center,
      child: const Text("Hello",
          style: TextStyle(fontSize: 20, color: Colors.white60)),
    );
  }
}

class SecondChild extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.green),
      alignment: Alignment.center,
      child: const Text(
        "World",
        style: TextStyle(fontSize: 20, color: Colors.white60),
      ),
    );
  }
}
