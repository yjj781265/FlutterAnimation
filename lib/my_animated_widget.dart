import 'package:flutter/material.dart';

class MyAnimatedWidget {
  final String _name, _filePath;
  final Widget _widget;

  MyAnimatedWidget(this._name, this._widget, this._filePath);

  get name => _name;

  Widget get widget => _widget;

  get filePath => _filePath;
}
