import 'package:flutter/cupertino.dart';
import 'package:flutter_animation_demo/AnmiatedWidgets/animated_container_demo.dart';
import 'package:flutter_animation_demo/AnmiatedWidgets/animated_switcher_demo.dart';
import 'package:flutter_animation_demo/AnmiatedWidgets/tween_animated_demo.dart';

import 'my_animated_widget.dart';

class WidgetChangeNotifier extends ChangeNotifier {
  List<MyAnimatedWidget> widgets = [
    MyAnimatedWidget("AnimatedContainer", AnimatedContainerDemo()),
    MyAnimatedWidget("TwinAnimatedWidget", TweenAnimatedDemo()),
    MyAnimatedWidget("AnimatedSwitcher", AnimatedSwitcherDemo())
  ];

  MyAnimatedWidget currentAnimatedWidget;

  WidgetChangeNotifier() {
    currentAnimatedWidget = widgets.first;
  }

  updateCurrentWidget(MyAnimatedWidget widget) {
    currentAnimatedWidget = widget;
    notifyListeners();
  }
}
