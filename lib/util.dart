import 'package:flutter/material.dart';

class Util {
  static final Util _util = Util.internal();

  factory Util() => _util;

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

  List<String> getSortedKeyList() {
    var list = curveMap.keys.toList();
    list.sort();
    return list;
  }

  Util.internal();
}
