import 'package:flutter/material.dart';

class TweenAnimatedDemo extends StatefulWidget {
  @override
  _TweenAnimatedDemoState createState() => _TweenAnimatedDemoState();
}

class _TweenAnimatedDemoState extends State<TweenAnimatedDemo> {
  double _targetSize = 300;
  Map<String, Curve> curveMap = {
    "elasticIn": Curves.elasticIn,
    "bounceIn": Curves.bounceIn,
    "bounceInOut": Curves.bounceInOut,
    "bounceOut": Curves.bounceOut,
    'decelerate': Curves.decelerate,
    'ease': Curves.ease,
    'easeIn': Curves.easeIn,
    'easeInBack': Curves.easeInBack,
    'easeInCirc': Curves.easeInCirc,
    'easeInExpo': Curves.easeInExpo,
    'easeInOut': Curves.easeInOut,
    'easeInOutBack': Curves.easeInOutBack,
    'easeInOutCubic': Curves.easeInOutCubic,
    'easeInOutCirc': Curves.easeInOutCirc,
    'easeInOutExpo': Curves.easeInOutExpo,
    'easeInOutQuad': Curves.easeInOutQuad,
    'easeInOutQuint': Curves.easeInOutQuint,
    'easeInSine': Curves.easeInSine,
    'easeInQuad': Curves.easeInQuad,
    'easeInQuint': Curves.easeInQuint,
    'fastLinearToSlowEaseIn': Curves.fastLinearToSlowEaseIn,
    'fastOutSlowIn': Curves.fastOutSlowIn,
    'linear': Curves.linear,
    'linearToEaseOut': Curves.linearToEaseOut,
    'slowMiddle': Curves.slowMiddle,
  };

  List<String> curveList = List();

  Curve _curve = Curves.linear;
  String currentDropDownValue;

  @override
  void initState() {
    curveList = curveMap.keys.toList();
    curveList.sort();
    currentDropDownValue = curveList.first;
    _curve = curveMap[currentDropDownValue];
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
                _curve = curveMap[currentDropDownValue];
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
