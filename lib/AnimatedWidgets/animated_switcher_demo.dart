import 'package:flutter/material.dart';

class AnimatedSwitcherDemo extends StatefulWidget {
  @override
  _AnimatedSwitcherDemoState createState() => _AnimatedSwitcherDemoState();
}

class _AnimatedSwitcherDemoState extends State<AnimatedSwitcherDemo> {
  Widget currentWidget = FlutterLogo(
    key: UniqueKey(),
  );
  bool isSwitched = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedSwitcher(
          duration: Duration(seconds: 3),
          child: SizedBox(
            key: UniqueKey(),
            child: currentWidget,
            width: 200,
            height: 200,
          ),
          transitionBuilder: (Widget child, Animation<double> animation) =>
              ScaleTransition(
            scale: animation,
            child: child,
          ),
        ),
        FlatButton.icon(
            onPressed: () {
              setState(() {
                isSwitched = !isSwitched;
                currentWidget =
                    isSwitched ? Image.asset("asset/troll.png") : FlutterLogo();
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
