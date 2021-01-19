import 'package:flutter/cupertino.dart';

import 'my_animated_widget.dart';

class WidgetChangeNotifier extends ChangeNotifier {
  Widget currentWidget = Text("Hello World");
  List<MyAnimatedWidget> widgets = [
    MyAnimatedWidget("Widget one", Text("Widget one")),
    MyAnimatedWidget("Widget two", Text("Widget two")),
    MyAnimatedWidget("Widget three", Text("Widget three"))
  ];

  updateCurrentWidget(Widget widget) {
    currentWidget = widget;
    notifyListeners();
  }
}
