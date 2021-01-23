import 'package:flutter/cupertino.dart';
import 'package:flutter_animation_demo/AnmiatedWidgets/animated_widget.dart';

import 'my_animated_widget.dart';

class WidgetChangeNotifier extends ChangeNotifier {
  List<MyAnimatedWidget> widgets = [
    MyAnimatedWidget("AnimatedContainer", AnimatedContainerDemo()),
    MyAnimatedWidget("Widget two", Text("Widget two")),
    MyAnimatedWidget("Widget three", Text("Widget three"))
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
