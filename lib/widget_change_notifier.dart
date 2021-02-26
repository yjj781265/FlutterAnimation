import 'package:flutter/cupertino.dart';
import 'package:flutter_animation_demo/AnimatedWidgets/animated_container_demo.dart';
import 'package:flutter_animation_demo/AnimatedWidgets/animated_crossfade_demo.dart';
import 'package:flutter_animation_demo/AnimatedWidgets/animated_list_demo.dart';
import 'package:flutter_animation_demo/AnimatedWidgets/animated_padding_demo.dart';
import 'package:flutter_animation_demo/AnimatedWidgets/animated_position_demo.dart';
import 'package:flutter_animation_demo/AnimatedWidgets/animated_switcher_demo.dart';
import 'package:flutter_animation_demo/AnimatedWidgets/animated_text_style_demo.dart';
import 'package:flutter_animation_demo/AnimatedWidgets/tween_animated_demo.dart';

import 'AnimatedWidgets/animated_align_demo.dart';
import 'AnimatedWidgets/animated_icon_demo.dart';
import 'my_animated_widget.dart';

class WidgetChangeNotifier extends ChangeNotifier {
  final List<MyAnimatedWidget> widgets = [
    MyAnimatedWidget("AnimatedContainer", AnimatedContainerDemo()),
    MyAnimatedWidget("TwinAnimatedWidget", TweenAnimatedDemo()),
    MyAnimatedWidget("AnimatedSwitcher", AnimatedSwitcherDemo()),
    MyAnimatedWidget("AnimatedPositioned", AnimatedPositionDemo()),
    MyAnimatedWidget("AnimatedAlign", AnimatedAlignDemo()),
    MyAnimatedWidget("AnimatedCrossFade", AnimatedCrossFadeDemo()),
    MyAnimatedWidget("AnimatedDefaultTextStyle", AnimatedTextStyleDemo()),
    MyAnimatedWidget("AnimatedList", AnimatedListDemo()),
    MyAnimatedWidget('AnimatedIcon', AnimatedIconDemo()),
    MyAnimatedWidget('AnimatedPadding', AnimatedPaddingDemo()),
  ];

  MyAnimatedWidget currentAnimatedWidget;

  WidgetChangeNotifier() {
    //sort list by name in alphabetical order
    widgets.sort((a, b) => a.name.compareTo(b.name));
    currentAnimatedWidget = widgets.first;
  }

  updateCurrentWidget(MyAnimatedWidget widget) {
    currentAnimatedWidget = widget;
    notifyListeners();
  }
}
