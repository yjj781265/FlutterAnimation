import 'package:flutter/material.dart';

import '../util.dart';

class AnimatedIconDemo extends StatefulWidget {
  @override
  _AnimatedIconDemoState createState() => _AnimatedIconDemoState();
}

class _AnimatedIconDemoState extends State<AnimatedIconDemo>
    with TickerProviderStateMixin {
  bool _flag = true;
  List<String> curveList = List();
  Curve _curve = Curves.linear;
  String currentDropDownValue;
  Animation<double> _myAnimation;
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    curveList = Util().getSortedKeyList();
    currentDropDownValue = curveList.first;
    _curve = Util().curveMap[currentDropDownValue];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _myAnimation = CurvedAnimation(curve: _curve, parent: _controller);
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
          child: Center(
            child: IconButton(
              iconSize: 100,
              icon: AnimatedIcon(
                icon: AnimatedIcons.play_pause,
                progress: _myAnimation,
              ),
              onPressed: () {
                if (_flag) {
                  _controller.forward();
                } else {
                  _controller.reverse();
                }
                _flag = !_flag;
              },
            ),
          ),
        )
      ],
    );
  }
}
