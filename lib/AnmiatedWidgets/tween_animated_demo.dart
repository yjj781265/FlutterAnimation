import 'package:flutter/material.dart';

import '../util.dart';

class TweenAnimatedDemo extends StatefulWidget {
  @override
  _TweenAnimatedDemoState createState() => _TweenAnimatedDemoState();
}

class _TweenAnimatedDemoState extends State<TweenAnimatedDemo> {
  double _targetSize = 300;
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
        Expanded(
          child: TweenAnimationBuilder(
            tween: Tween<double>(
              begin: 50,
              end: _targetSize,
            ),
            duration: Duration(seconds: 3),
            onEnd: () {
              setState(() {
                if (_targetSize == 50) {
                  _targetSize = 300;
                } else {
                  _targetSize = 50;
                }
              });
            },
            curve: _curve,
            builder: (BuildContext ctx, double size, Widget myChild) {
              return Container(
                width: size,
                height: size,
                child: FlutterLogo(),
              );
            },
          ),
        ),
      ],
    );
  }
}
