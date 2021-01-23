import 'package:flutter/material.dart';

class AnimatedContainerDemo extends StatefulWidget {
  @override
  _AnimatedContainerDemoState createState() => _AnimatedContainerDemoState();
}

class _AnimatedContainerDemoState extends State<AnimatedContainerDemo> {
  bool isBigger = false;
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
    super.initState();
    curveList = curveMap.keys.toList();
    curveList.sort();
    currentDropDownValue = curveList.first;
    _curve = curveMap[currentDropDownValue];
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
