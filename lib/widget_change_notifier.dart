import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation_demo/AnimatedWidgets/animated_container_demo.dart';
import 'package:flutter_animation_demo/AnimatedWidgets/animated_crossfade_demo.dart';
import 'package:flutter_animation_demo/AnimatedWidgets/animated_list_demo.dart';
import 'package:flutter_animation_demo/AnimatedWidgets/animated_opacity_demo.dart';
import 'package:flutter_animation_demo/AnimatedWidgets/animated_padding_demo.dart';
import 'package:flutter_animation_demo/AnimatedWidgets/animated_position_demo.dart';
import 'package:flutter_animation_demo/AnimatedWidgets/animated_switcher_demo.dart';
import 'package:flutter_animation_demo/AnimatedWidgets/animated_text_style_demo.dart';
import 'package:flutter_animation_demo/AnimatedWidgets/hero_demo.dart';
import 'package:flutter_animation_demo/AnimatedWidgets/tween_animated_demo.dart';

import 'AnimatedWidgets/animated_align_demo.dart';
import 'AnimatedWidgets/animated_icon_demo.dart';
import 'my_animated_widget.dart';

class WidgetChangeNotifier extends ChangeNotifier {
  final List<MyAnimatedWidget> widgets = [
    MyAnimatedWidget(
        "",
        DrawerHeader(
          child: FlutterLogo(),
        ),
        null),
    MyAnimatedWidget("AnimatedContainer", AnimatedContainerDemo(),
        'animated_container_demo.dart'),
    MyAnimatedWidget(
        "TwinAnimatedWidget", TweenAnimatedDemo(), 'tween_animated_demo.dart'),
    MyAnimatedWidget("AnimatedSwitcher", AnimatedSwitcherDemo(),
        'animated_switcher_demo.dart'),
    MyAnimatedWidget("AnimatedPositioned", AnimatedPositionDemo(),
        'animated_position_demo.dart'),
    MyAnimatedWidget(
        "AnimatedAlign", AnimatedAlignDemo(), 'animated_align_demo.dart'),
    MyAnimatedWidget("AnimatedCrossFade", AnimatedCrossFadeDemo(),
        'animated_crossfade_demo.dart'),
    MyAnimatedWidget("AnimatedDefaultTextStyle", AnimatedTextStyleDemo(),
        'animated_text_style_demo.dart'),
    MyAnimatedWidget(
        "AnimatedList", AnimatedListDemo(), 'animated_list_demo.dart'),
    MyAnimatedWidget(
        'AnimatedIcon', AnimatedIconDemo(), 'animated_icon_demo.dart'),
    MyAnimatedWidget(
        'AnimatedPadding', AnimatedPaddingDemo(), 'animated_padding_demo.dart'),
    MyAnimatedWidget(
        'AnimatedOpacity', AnimatedOpacityDemo(), 'animated_opacity_demo.dart'),
    MyAnimatedWidget('Hero', HeroDemo(), 'hero_demo.dart')
  ];

  MyAnimatedWidget currentAnimatedWidget;

  WidgetChangeNotifier() {
    //sort list by name in alphabetical order
    widgets.sort((a, b) => a.name.compareTo(b.name));
    currentAnimatedWidget = widgets[1];
  }

  updateCurrentWidget(MyAnimatedWidget widget) {
    currentAnimatedWidget = widget;
    notifyListeners();
  }
}
